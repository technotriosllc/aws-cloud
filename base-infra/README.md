## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.3.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.38.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_amplify_dev_deployment"></a> [amplify\_dev\_deployment](#module\_amplify\_dev\_deployment) | ./modules/s3_bucket | n/a |
| <a name="module_amplify_stage_deployment"></a> [amplify\_stage\_deployment](#module\_amplify\_stage\_deployment) | ./modules/s3_bucket | n/a |
| <a name="module_aws_cloudtrail_logs"></a> [aws\_cloudtrail\_logs](#module\_aws\_cloudtrail\_logs) | ./modules/s3_bucket | n/a |
| <a name="module_base_iam_policy"></a> [base\_iam\_policy](#module\_base\_iam\_policy) | ./modules/aws_account_policy | n/a |
| <a name="module_base_vpc"></a> [base\_vpc](#module\_base\_vpc) | ./modules/vpc | n/a |
| <a name="module_cloudwatch_dashboard_cloudfront_studio"></a> [cloudwatch\_dashboard\_cloudfront\_studio](#module\_cloudwatch\_dashboard\_cloudfront\_studio) | ./modules/cloudwatch_dashboard | n/a |
| <a name="module_cloudwatch_dashboard_devops_health"></a> [cloudwatch\_dashboard\_devops\_health](#module\_cloudwatch\_dashboard\_devops\_health) | ./modules/cloudwatch_dashboard | n/a |
| <a name="module_codegen_logs"></a> [codegen\_logs](#module\_codegen\_logs) | ./modules/s3_bucket | n/a |
| <a name="module_codegen_plasmic_app_crt"></a> [codegen\_plasmic\_app\_crt](#module\_codegen\_plasmic\_app\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_comm_between_nodes_eks_sg"></a> [comm\_between\_nodes\_eks\_sg](#module\_comm\_between\_nodes\_eks\_sg) | ./modules/security_group | n/a |
| <a name="module_cpu_utilization_db"></a> [cpu\_utilization\_db](#module\_cpu\_utilization\_db) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_create_ec2_instance"></a> [create\_ec2\_instance](#module\_create\_ec2\_instance) | ./modules/instances | n/a |
| <a name="module_devtun_crt"></a> [devtun\_crt](#module\_devtun\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_disk_queue_depth_alarm_db"></a> [disk\_queue\_depth\_alarm\_db](#module\_disk\_queue\_depth\_alarm\_db) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./modules/eks-cluster | n/a |
| <a name="module_eks_cluster_sg"></a> [eks\_cluster\_sg](#module\_eks\_cluster\_sg) | ./modules/security_group | n/a |
| <a name="module_eks_comm_between_cp_wrk_nodes_sg"></a> [eks\_comm\_between\_cp\_wrk\_nodes\_sg](#module\_eks\_comm\_between\_cp\_wrk\_nodes\_sg) | ./modules/security_group | n/a |
| <a name="module_eks_comm_nodegroup_internal_sg"></a> [eks\_comm\_nodegroup\_internal\_sg](#module\_eks\_comm\_nodegroup\_internal\_sg) | ./modules/security_group | n/a |
| <a name="module_eks_kafka_sg"></a> [eks\_kafka\_sg](#module\_eks\_kafka\_sg) | ./modules/security_group | n/a |
| <a name="module_eks_postgres_sg"></a> [eks\_postgres\_sg](#module\_eks\_postgres\_sg) | ./modules/security_group | n/a |
| <a name="module_eks_redis_sg"></a> [eks\_redis\_sg](#module\_eks\_redis\_sg) | ./modules/security_group | n/a |
| <a name="module_external_plasmic_app"></a> [external\_plasmic\_app](#module\_external\_plasmic\_app) | ./modules/external_hosted_zone_config | n/a |
| <a name="module_free_storage_db_instance"></a> [free\_storage\_db\_instance](#module\_free\_storage\_db\_instance) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_gerrit_plasmic_app_crt"></a> [gerrit\_plasmic\_app\_crt](#module\_gerrit\_plasmic\_app\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_gerrit_sg"></a> [gerrit\_sg](#module\_gerrit\_sg) | ./modules/security_group | n/a |
| <a name="module_host_plasmic_dev_crt"></a> [host\_plasmic\_dev\_crt](#module\_host\_plasmic\_dev\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_host_plasmicdev_app_crt"></a> [host\_plasmicdev\_app\_crt](#module\_host\_plasmicdev\_app\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_http_error_lb_a7d1793684064461fb95f2d0f78651d1"></a> [http\_error\_lb\_a7d1793684064461fb95f2d0f78651d1](#module\_http\_error\_lb\_a7d1793684064461fb95f2d0f78651d1) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_http_error_lb_a846b4e416ff04bfc9a27a1ba51a5710"></a> [http\_error\_lb\_a846b4e416ff04bfc9a27a1ba51a5710](#module\_http\_error\_lb\_a846b4e416ff04bfc9a27a1ba51a5710) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_http_error_lb_afd5b7ee577154d7793aeca945ed96c6"></a> [http\_error\_lb\_afd5b7ee577154d7793aeca945ed96c6](#module\_http\_error\_lb\_afd5b7ee577154d7793aeca945ed96c6) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_img_plasmic_app_crt"></a> [img\_plasmic\_app\_crt](#module\_img\_plasmic\_app\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_internal_hosted_zone"></a> [internal\_hosted\_zone](#module\_internal\_hosted\_zone) | ./modules/hosted_zone_config | n/a |
| <a name="module_jenkins_plasmic_app_crt"></a> [jenkins\_plasmic\_app\_crt](#module\_jenkins\_plasmic\_app\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_jenkins_vpc_sg"></a> [jenkins\_vpc\_sg](#module\_jenkins\_vpc\_sg) | ./modules/security_group | n/a |
| <a name="module_latency_alarm_a0c446de22b2c4535ba7af77345fae10"></a> [latency\_alarm\_a0c446de22b2c4535ba7af77345fae10](#module\_latency\_alarm\_a0c446de22b2c4535ba7af77345fae10) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_latency_alarm_a49a6081b1f1142c9ba6556fed797d47"></a> [latency\_alarm\_a49a6081b1f1142c9ba6556fed797d47](#module\_latency\_alarm\_a49a6081b1f1142c9ba6556fed797d47) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_latency_alarm_a7beb6a7cc2334ba68cb405d4a487144"></a> [latency\_alarm\_a7beb6a7cc2334ba68cb405d4a487144](#module\_latency\_alarm\_a7beb6a7cc2334ba68cb405d4a487144) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_latency_alarm_a7d1793684064461fb95f2d0f78651d1"></a> [latency\_alarm\_a7d1793684064461fb95f2d0f78651d1](#module\_latency\_alarm\_a7d1793684064461fb95f2d0f78651d1) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_latency_alarm_a846b4e416ff04bfc9a27a1ba51a5710"></a> [latency\_alarm\_a846b4e416ff04bfc9a27a1ba51a5710](#module\_latency\_alarm\_a846b4e416ff04bfc9a27a1ba51a5710) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_latency_alarm_afd5b7ee577154d7793aeca945ed96c6"></a> [latency\_alarm\_afd5b7ee577154d7793aeca945ed96c6](#module\_latency\_alarm\_afd5b7ee577154d7793aeca945ed96c6) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_plasmic_clips"></a> [plasmic\_clips](#module\_plasmic\_clips) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_codegen_origin_elb_logs"></a> [plasmic\_codegen\_origin\_elb\_logs](#module\_plasmic\_codegen\_origin\_elb\_logs) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_cypress"></a> [plasmic\_cypress](#module\_plasmic\_cypress) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_dev"></a> [plasmic\_dev](#module\_plasmic\_dev) | ./modules/external_hosted_zone_config | n/a |
| <a name="module_plasmic_discourse_backups"></a> [plasmic\_discourse\_backups](#module\_plasmic\_discourse\_backups) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_discourse_uploads"></a> [plasmic\_discourse\_uploads](#module\_plasmic\_discourse\_uploads) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_grafana"></a> [plasmic\_grafana](#module\_plasmic\_grafana) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_link"></a> [plasmic\_link](#module\_plasmic\_link) | ./modules/external_hosted_zone_config | n/a |
| <a name="module_plasmic_loader_assets"></a> [plasmic\_loader\_assets](#module\_plasmic\_loader\_assets) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_loader_assets_dev"></a> [plasmic\_loader\_assets\_dev](#module\_plasmic\_loader\_assets\_dev) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_misc"></a> [plasmic\_misc](#module\_plasmic\_misc) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_page_templates_thumbs"></a> [plasmic\_page\_templates\_thumbs](#module\_plasmic\_page\_templates\_thumbs) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_prometheus_metrics"></a> [plasmic\_prometheus\_metrics](#module\_plasmic\_prometheus\_metrics) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_ray"></a> [plasmic\_ray](#module\_plasmic\_ray) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_s3_inventory"></a> [plasmic\_s3\_inventory](#module\_plasmic\_s3\_inventory) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_site"></a> [plasmic\_site](#module\_plasmic\_site) | ./modules/external_hosted_zone_config | n/a |
| <a name="module_plasmic_site_assets"></a> [plasmic\_site\_assets](#module\_plasmic\_site\_assets) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_static1"></a> [plasmic\_static1](#module\_plasmic\_static1) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_studio_logs"></a> [plasmic\_studio\_logs](#module\_plasmic\_studio\_logs) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_tracker1"></a> [plasmic\_tracker1](#module\_plasmic\_tracker1) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_trackter1_logs"></a> [plasmic\_trackter1\_logs](#module\_plasmic\_trackter1\_logs) | ./modules/s3_bucket | n/a |
| <a name="module_plasmic_website"></a> [plasmic\_website](#module\_plasmic\_website) | ./modules/external_hosted_zone_config | n/a |
| <a name="module_plasmic_website_b"></a> [plasmic\_website\_b](#module\_plasmic\_website\_b) | ./modules/external_hosted_zone_config | n/a |
| <a name="module_plasmicdev_com"></a> [plasmicdev\_com](#module\_plasmicdev\_com) | ./modules/external_hosted_zone_config | n/a |
| <a name="module_plasmiq_app"></a> [plasmiq\_app](#module\_plasmiq\_app) | ./modules/external_hosted_zone_config | n/a |
| <a name="module_prod_cpu_alarm"></a> [prod\_cpu\_alarm](#module\_prod\_cpu\_alarm) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_prod_db"></a> [prod\_db](#module\_prod\_db) | ./modules/security_group | n/a |
| <a name="module_prod_disk_alarm"></a> [prod\_disk\_alarm](#module\_prod\_disk\_alarm) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_production_server_sg"></a> [production\_server\_sg](#module\_production\_server\_sg) | ./modules/security_group | n/a |
| <a name="module_rds_memory_alarm"></a> [rds\_memory\_alarm](#module\_rds\_memory\_alarm) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_site_assets_plasmic_app_crt"></a> [site\_assets\_plasmic\_app\_crt](#module\_site\_assets\_plasmic\_app\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_star_devtun_plasmic_app_crt"></a> [star\_devtun\_plasmic\_app\_crt](#module\_star\_devtun\_plasmic\_app\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_static1_plasmic_app_crt"></a> [static1\_plasmic\_app\_crt](#module\_static1\_plasmic\_app\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_studio_cloudfront_crt"></a> [studio\_cloudfront\_crt](#module\_studio\_cloudfront\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_studio_plasmic_app_crt"></a> [studio\_plasmic\_app\_crt](#module\_studio\_plasmic\_app\_crt) | ./modules/acm_certificate | n/a |
| <a name="module_unhealthy_host_count_a0c446de22b2c4535ba7af77345fae10"></a> [unhealthy\_host\_count\_a0c446de22b2c4535ba7af77345fae10](#module\_unhealthy\_host\_count\_a0c446de22b2c4535ba7af77345fae10) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_unhealthy_host_count_a49a6081b1f1142c9ba6556fed797d47"></a> [unhealthy\_host\_count\_a49a6081b1f1142c9ba6556fed797d47](#module\_unhealthy\_host\_count\_a49a6081b1f1142c9ba6556fed797d47) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_unhealthy_host_count_a7beb6a7cc2334ba68cb405d4a487144"></a> [unhealthy\_host\_count\_a7beb6a7cc2334ba68cb405d4a487144](#module\_unhealthy\_host\_count\_a7beb6a7cc2334ba68cb405d4a487144) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_unhealthy_host_count_a7d1793684064461fb95f2d0f78651d1"></a> [unhealthy\_host\_count\_a7d1793684064461fb95f2d0f78651d1](#module\_unhealthy\_host\_count\_a7d1793684064461fb95f2d0f78651d1) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_unhealthy_host_count_a846b4e416ff04bfc9a27a1ba51a5710"></a> [unhealthy\_host\_count\_a846b4e416ff04bfc9a27a1ba51a5710](#module\_unhealthy\_host\_count\_a846b4e416ff04bfc9a27a1ba51a5710) | ./modules/cloudwatch_alarms | n/a |
| <a name="module_unhealthy_host_count_afd5b7ee577154d7793aeca945ed96c6"></a> [unhealthy\_host\_count\_afd5b7ee577154d7793aeca945ed96c6](#module\_unhealthy\_host\_count\_afd5b7ee577154d7793aeca945ed96c6) | ./modules/cloudwatch_alarms | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.eks_asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_cloudfront_distribution.codegen_cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.gerrit_cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.host_dev_cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.host_plasmic_dev_cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.img_cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.jenkins_cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.static1_cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.static_assets_cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.studio_app_cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.studio_cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.viewer_response_cf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudtrail.management_events](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |
| [aws_cloudwatch_event_rule.AutoScalingManagedRule_rl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.GuardDuty_Finding_rl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.dns_record_event_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.AutoScalingManagedRule_autoscaling_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.GuardDuty_Finding_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.dns_record_event_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_log_group.container_insight_performance_lg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.kafka_logs_lg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.plasmic_cluster_lg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_db_instance.posthog_postgres](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.default_vpc_sg_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_dynamodb_table.tfstate_lock_table_dydb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_elasticache_replication_group.posthog_redis_cluster_replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.posthog_redis_cluster_subnet_grp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_glue_catalog_database.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_database) | resource |
| [aws_glue_catalog_table.default_003A_codegen_cloudfront_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_table) | resource |
| [aws_glue_catalog_table.default_studio_cloudfront_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_table) | resource |
| [aws_iam_instance_profile.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.lambda_func_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.basic_execution_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2_read_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2_ssm_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.route53_write_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_alias.eks_cluster_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.eks_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_lambda_function.dns_record_lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_cloudwatch_to_call_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_launch_template.eks_lt_301](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_launch_template.eks_lt_425](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_msk_cluster.plasmic_posthog_kafka](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/msk_cluster) | resource |
| [aws_organizations_account.plasmic_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account) | resource |
| [aws_organizations_organization.plasmic_org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |
| [aws_route53_record.acm_validations_dev_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.acme_challenge_prox1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.admin_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.api_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.blog_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.cloud_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.cname_plasmicdev_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.dev_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.domain_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.email_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.forum_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ftp_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.help_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.host_dev_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.host_plasmicdev_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.host_q_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hosting_test_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hosting_test_eight_q_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hosting_test_five_q_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hosting_test_four_q_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hosting_test_nine_q_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hosting_test_seven_q_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hosting_test_two_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hostingtest_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hostingtest_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hostingtest_eight_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hostingtest_four_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.hostingtest_six_q_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.imap_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.mail_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.mt_q_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ns_one_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ns_three_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ns_two_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_MX](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_TXT](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_acme_challenge_analytics_TXT](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_amazonses_TXT](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_amazonses_dkim_3nzjntwps5da7ppyc3qb6bjm2dtrd3w3_forum_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_amazonses_dkim_d2xacp7ampmvzatyptc2tyrf23bf7u2t_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_amazonses_dkim_dxjlha4htitt7w4kjgy4gm73d5lv5lj7_forum_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_amazonses_dkim_iwqenifmx627zbhczrbzfpifyi7durpw_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_amazonses_dkim_uzxrk4axrtjpvdqwgyhuy26ipy65u5eu_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_amazonses_dkim_wp5dpyoecnzjmx7avc6hajwo5bg77a6u_forum_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_amazonses_forum_TXT](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_analytics_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_aws_acm_0c22416c6b46f8520d46eb55c49af200_codegen_plasmic_app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_aws_acm_668f7556c3e2e70a00eb56836b743d7e_gerrit_aws_plasmic_app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_aws_acm_71e1d98247c8e323bfc37a402baa58f8_data_plasmic_app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_aws_acm_7b13010340ad7aa0b2d9ba8af4f709ae_jenkins_aws_plasmic_app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_aws_acm_7ffb0ab5a6f5d11fbea7a7df78863a41_site_assets_plasmic_app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_aws_acm_8474061dade0022b489943dd5b930463_static1_plasmic_app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_aws_acm_a38e4702604efd0d24ef5d56962fa2a1_devtun_plasmic_app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_aws_acm_bfb8f7d4b91034b7a98bd75c6b716e69_img_plasmic_app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_aws_acm_e1b6f45aec60743880b38f750bc39772_studio_plasmic_app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_aws_acm_fb0435c6f55f76e118550ea20f619889_studio_cloudfront_plasmic_app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_blog0_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_blog_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_clickhouse_db_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_cname_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_codegen_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_codegen_origin_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_data_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_data_origin_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_db_aws_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_devtun_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_dmarc_TXT](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_docs_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_forum_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_forum_MX](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_gerrit_aws_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_gerrit_origin_aws_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_grafana_aws_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_help_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_hostingtest_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_img_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_img_origin_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_jenkins_aws_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_jenkins_origin_aws_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_kb_aws_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_kibana_aws_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_mt_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_posthog_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_prod_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_site_assets_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_star_devtun_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_static1_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_status_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_strapi_app_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_studio_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_studio_aws_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_studio_cloudfront_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_studio_origin_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_test_forum_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_test_forum_jenkins_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_test_forum_jenkins_origin_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_test_forum_origin_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_app_www_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmic_dev_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmicdev_host_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.plasmicops_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.pop_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.pop_three_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.prox1_plasmic_link](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.secure_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.server_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.shop_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.smtp_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.star_tunnel_dev_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.store_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.studio_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.support_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.test_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.tunnel_dev_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.tunnel_dev_TXT](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.webmail_CNAME](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_ses_domain_identity.forum_ses_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_ses_domain_identity.plasmic_ses_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_sns_topic.guard_duty_to_email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic.prod_disk_full_sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic.slack_sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.prod_disk_full_subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic_subscription.slack_subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_vpc_peering_connection.base_vpc_eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_vpc_peering_connection.default_vpc_eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [archive_file.lambda_func_zip](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_iam_policy.AWS_Lambda_Basic_Execution_Role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.ec2_read_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.route53_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | Provide AWS account ID. | `string` | n/a | yes |
| <a name="input_az"></a> [az](#input\_az) | n/a | `list(string)` | n/a | yes |
| <a name="input_dns_record_ttl"></a> [dns\_record\_ttl](#input\_dns\_record\_ttl) | The TTL of the record. | `number` | `60` | no |
| <a name="input_dns_record_type"></a> [dns\_record\_type](#input\_dns\_record\_type) | The record type. | `string` | `"A"` | no |
| <a name="input_eks_az"></a> [eks\_az](#input\_eks\_az) | AWS Availability zone | `list(string)` | n/a | yes |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | Elastic kubernetes Service Cluster Name. | `string` | n/a | yes |
| <a name="input_eks_desired_size"></a> [eks\_desired\_size](#input\_eks\_desired\_size) | Node group desired count. | `number` | n/a | yes |
| <a name="input_eks_env_code"></a> [eks\_env\_code](#input\_eks\_env\_code) | Environment code Expected values: dev, qa, staging, uat, prod. | `string` | n/a | yes |
| <a name="input_eks_max_size"></a> [eks\_max\_size](#input\_eks\_max\_size) | Node group max node size. | `number` | n/a | yes |
| <a name="input_eks_min_size"></a> [eks\_min\_size](#input\_eks\_min\_size) | Node group minimum node size. | `number` | n/a | yes |
| <a name="input_eks_node_type"></a> [eks\_node\_type](#input\_eks\_node\_type) | Instance type for node group. | `string` | n/a | yes |
| <a name="input_eks_private_subnet"></a> [eks\_private\_subnet](#input\_eks\_private\_subnet) | Private Subnet for AWS VPC. | `list(string)` | n/a | yes |
| <a name="input_eks_public_subnet"></a> [eks\_public\_subnet](#input\_eks\_public\_subnet) | Public subnet for AWS VPC. | `list(string)` | n/a | yes |
| <a name="input_eks_vpc_cidr"></a> [eks\_vpc\_cidr](#input\_eks\_vpc\_cidr) | CIDR block for VPC. | `string` | n/a | yes |
| <a name="input_enabled_hosted_zone"></a> [enabled\_hosted\_zone](#input\_enabled\_hosted\_zone) | To check, for enabling hosted zone. default FALSE | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Application environment | `string` | `null` | no |
| <a name="input_func_name"></a> [func\_name](#input\_func\_name) | Lambda function Name. | `string` | n/a | yes |
| <a name="input_hosted_zone"></a> [hosted\_zone](#input\_hosted\_zone) | n/a | `string` | `""` | no |
| <a name="input_internal_domain"></a> [internal\_domain](#input\_internal\_domain) | This is the name of the hosted zone. | `string` | n/a | yes |
| <a name="input_lambda_func_role"></a> [lambda\_func\_role](#input\_lambda\_func\_role) | AWS lambda function attached role name | `string` | n/a | yes |
| <a name="input_private_subnet"></a> [private\_subnet](#input\_private\_subnet) | Private Subnet for VPC. | `list(string)` | n/a | yes |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | Public Subnet for VPC. | `list(string)` | n/a | yes |
| <a name="input_record_type"></a> [record\_type](#input\_record\_type) | (Required) The record type. Valid values are A, AAAA, CAA, CNAME, DS, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region to AWS instance. | `string` | `null` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | (Required for non-alias records) The TTL of the record. | `number` | `300` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR to create VPC. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_name"></a> [instance\_name](#output\_instance\_name) | n/a |
| <a name="output_instance_private_ip"></a> [instance\_private\_ip](#output\_instance\_private\_ip) | n/a |
| <a name="output_internal_hosted_zone"></a> [internal\_hosted\_zone](#output\_internal\_hosted\_zone) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
