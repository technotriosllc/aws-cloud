import os
import boto3
import logging
import json

logger = logging.getLogger()
logger.setLevel(logging.INFO)

# """ Default values """
DNS_RECORD_TYPE = 'A'
DNS_RECORD_TTL = 300


def update_route53_record(region, instance_id, dns_record_type, dns_record_ttl):
    ec2 = boto3.client('ec2', region_name=region)
    ec2_desc_instance = ec2.describe_instances(InstanceIds=[instance_id])
    ec2_private_ip = ec2_desc_instance['Reservations'][0]['Instances'][0]['PrivateIpAddress']

    ec2_tags_res = ec2.describe_tags(Filters=[
        {'Name': 'resource-id',
         'Values': [instance_id]},
        {'Name': 'key', 'Values': ['Name']}
    ])

    dns_record_name = ec2_tags_res['Tags'][0]['Value']
    if dns_record_name[-1] == '.':
        dns_record_name = dns_record_name[:-1]

    route53 = boto3.client('route53', region_name=region)

    private_hosted_zone_id =  os.environ.get("hosted_zone")

    route53.change_resource_record_sets(
        HostedZoneId=private_hosted_zone_id,
        ChangeBatch={
            'Changes': [
                {
                    'Action': 'UPSERT',
                    'ResourceRecordSet': {
                        'Name': dns_record_name + '.plasmic.internal',
                        'Type': dns_record_type,
                        'ResourceRecords': [
                            {
                                'Value': ec2_private_ip
                            },
                        ],
                        'TTL': dns_record_ttl
                    }
                }
            ]
        }
    )
    logger.info(
        'The Route53 record updated successfully. ' + dns_record_name + ': [' + dns_record_type + '] ' + ec2_private_ip)
    return

def remove_route53_record(region, instance_id, dns_record_type, dns_record_ttl):
    ec2 = boto3.client('ec2', region_name=region)
    ec2_desc_instance = ec2.describe_instances(InstanceIds=[instance_id])
    ec2_private_ip = ec2_desc_instance['Reservations'][0]['Instances'][0]['PrivateIpAddress']

    ec2_tags_res = ec2.describe_tags(Filters=[
        {'Name': 'resource-id',
         'Values': [instance_id]},
        {'Name': 'key', 'Values': ['Name']}
    ])

    dns_record_name = ec2_tags_res['Tags'][0]['Value']
    if dns_record_name[-1] == '.':
        dns_record_name = dns_record_name[:-1]

    route53 = boto3.client('route53', region_name=region)

    private_hosted_zone_id =  os.environ.get("hosted_zone")

    route53.change_resource_record_sets(
        HostedZoneId=private_hosted_zone_id,
        ChangeBatch={
            'Changes': [
                {
                    'Action': 'DELETE',
                    'ResourceRecordSet': {
                        'Name': dns_record_name + '.plasmic.internal',
                        'Type': dns_record_type,
                        'ResourceRecords': [
                            {
                                'Value': ec2_private_ip
                            },
                        ],
                        'TTL': dns_record_ttl
                    }
                }
            ]
        }
    )
    logger.info(
        'The Route53 record deleted successfully. ' + dns_record_name + ': [' + dns_record_type + '] ' + ec2_private_ip)
    return

def lambda_handler(event, context):
    region = os.environ.get("region")
    dns_record_type = os.environ.get("dns_record_type") if os.environ.get("dns_record_type") else DNS_RECORD_TYPE
    dns_record_ttl = int(os.environ.get("dns_record_ttl")) if os.environ.get("dns_record_ttl") else DNS_RECORD_TTL
    try:
        if str(event['detail']['eventName']) == "RebootInstances":
            instance_id = str(event['detail']['requestParameters']['instancesSet']['items'][0]['instanceId'])
            update_route53_record(region, instance_id, dns_record_type, dns_record_ttl)
        elif str(event['detail']['eventName']) == "StartInstances":
            instance_id = str(event['detail']['requestParameters']['instancesSet']['items'][0]['instanceId'])
            update_route53_record(region, instance_id, dns_record_type, dns_record_ttl)
        elif str(event['detail']['eventName']) == "TerminateInstances":
            instance_id = str(event['detail']['requestParameters']['instancesSet']['items'][0]['instanceId'])
            remove_route53_record(region, instance_id, dns_record_type, dns_record_ttl)
        else:
            instance_id = str(event['detail']['responseElements']['instancesSet']['items'][0]['instanceId'])
            update_route53_record(region, instance_id, dns_record_type, dns_record_ttl)
    except Exception as error:
        logger.exception(error)
    return