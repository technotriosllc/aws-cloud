import boto3
import json

client = boto3.client('s3')


def disable_public_block(list_of_buckets):
    # To remove bucket which are required to be public.
    list_of_buckets.remove(' ')

    print("make bucket private execution start...!!")
    for bkt in list_of_buckets:
        access = client.put_public_access_block(Bucket=bkt, ChecksumAlgorithm='SHA256',
                                                PublicAccessBlockConfiguration={
                                                    'BlockPublicAcls': True,
                                                    'IgnorePublicAcls': True,
                                                    'BlockPublicPolicy': True,
                                                    'RestrictPublicBuckets': True
                                                },
                                                )
        print(access)
    print("execution end...!!")


def create_log_bucket(log_bkt_name):
    print("Create log bucket")
    kw_args = {
        'Bucket': log_bkt_name,
        'ACL': 'log-delivery-write',
        'CreateBucketConfiguration': dict(LocationConstraint='us-west-2')
    }
    logging_bucket = client.create_bucket(**kw_args)
    log_bucket = json.dumps(logging_bucket)
    print(log_bucket)


def enable_bucket_logging(list_of_bkt, log_bkt_name):
    print("Enable bucket logging..!!")
    for bkt in list_of_bkt:
        kw_args = {
            'Bucket': bkt,
            'BucketLoggingStatus': {
                'LoggingEnabled': {
                    'TargetBucket': log_bkt_name,
                    'TargetPrefix': 'bucketLogs/'
                }
            }
        }
        enabled = client.put_bucket_logging(**kw_args)
        print(enabled)
    print("Execution End...!!!")


def enable_encryption(list_of_bkt):
    print("Enable default encryption on buckets..!")
    for bkt in list_of_bkt:
        encryption_response = client.put_bucket_encryption(
            Bucket=bkt,
            ChecksumAlgorithm='SHA256',
            ServerSideEncryptionConfiguration={
                'Rules': [
                    {
                        'ApplyServerSideEncryptionByDefault': {
                            'SSEAlgorithm': 'AES256'
                        },
                        'BucketKeyEnabled': True
                    },
                ]
            }
        )
        print(encryption_response)
    print("Encryption End..!!!")


def enable_versioning(list_of_bkt):
    print("Enable versioning on all buckets..!")
    for bkt in list_of_bkt:
        versioning_response = client.put_bucket_versioning(
            Bucket='string',
            ChecksumAlgorithm='SHA256',
            VersioningConfiguration={
                'Status': 'Enabled'
            }
        )
        print(versioning_response)
    print("Execution End..!!!")


# def allow_cross_region_logging(bkts):
#     print("Enable Cross s3 location logging")
#     for bkt in bkts:
#         bucket_policy = {"Version": "2012-10-17",
#                          "Statement": [
#                              {
#                                  "Sid": "S3ServerAccessLogsPolicy",
#                                  "Effect": "Allow",
#                                  "Principal": {
#                                      "Service": "logging.s3.amazonaws.com"
#                                  },
#                                  "Action": [
#                                      "s3:PutObject"
#                                  ],
#                                  "Resource": [
#                                      "arn:aws:s3:::plasmic-bucket-logging-xtms/bucketLogs/*"
#                                  ]
#                              }
#                             ]
#                          }
#         policy_string = json.dumps(bucket_policy)
#         print(policy_string)
#         cross_region_logging = client.put_bucket_policy(
#             Bucket=bkt,
#             Policy=policy_string
#         )
#         print(cross_region_logging)


def main():
    buckets = []
    response = client.list_buckets()
    # variables required
    # Logging BucketName
    log_bucket_name = ' '
    other_region_buckets = ["elasticbeanstalk-us-east-1-939375546786", "amplify-test-staging-52949-deployment"]
    for bucket in response['Buckets']:
        buckets += {bucket["Name"]}
    create_log_bucket(log_bucket_name)
    # allow_cross_region_logging(other_region_buckets)
    enable_bucket_logging(buckets, log_bucket_name)
    enable_encryption(buckets)
    enable_versioning(buckets)
    disable_public_block(buckets)


if __name__ == "__main__":
    main()
