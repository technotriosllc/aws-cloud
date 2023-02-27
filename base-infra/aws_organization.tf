resource "aws_organizations_account" "plasmic_account"{
  email     = "yang@plasmic.app"
  name      = "plasmic"
  parent_id = "r-l4rj"
}

resource "aws_organizations_organization" "plasmic_org" {
  enabled_policy_types = ["SERVICE_CONTROL_POLICY", "TAG_POLICY"]
  feature_set          = "ALL"
}


