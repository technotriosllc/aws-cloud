aws_account_id = "939375546786"
region         = "us-west-2"
vpc_cidr       = "10.10.0.0/16"
az             = ["us-west-2a", "us-west-2b", "us-west-2c"]
public_subnet  = ["10.10.0.0/19", "10.10.64.0/19", "10.10.32.0/19"]
private_subnet = ["10.10.96.0/19", "10.10.160.0/19", "10.10.128.0/19"]

#### internal host zone configuration ####
internal_domain     = "plasmic.internal"
enabled_hosted_zone = true
record_type         = "A"
ttl                 = 300

eks_cluster_name   = "plasmic-cluster"
eks_env_code       = "DEV"
eks_node_type      = "c6a.xlarge"
eks_vpc_cidr       = "192.168.0.0/16"
eks_max_size       = 10
eks_min_size       = 2
eks_desired_size   = 7
eks_az             = ["us-west-2a", "us-west-2b", "us-west-2c"]
eks_public_subnet  = ["192.168.32.0/19", "192.168.64.0/19", "192.168.0.0/19"]
eks_private_subnet = ["192.168.128.0/19", "192.168.160.0/19", "192.168.96.0/19"]

## Parameter required for update-dns-record for internal dns lambda function
hosted_zone      = "/hostedzone/Z0505945UZA7XPIU2NOZ"
lambda_func_role = "update-route53-dns-record-internal"
func_name        = "update-route53-dns-record-internal"
dns_record_ttl   = 60
dns_record_type  = "A"