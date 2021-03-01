Terraform module for managing [AWS IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users.html).

Module requires, that user should provide its [keybase](https://keybase.io) id in order to encrypt password for AWS account.

___
###Usage

```hcl-terraform
module "my_user" {
  source = "../modules/iam_users"
  iam_user_name = "my_user_name"
  iam_user_keybase_username = " my_user_name_keybase_id"
  iam_user_groups = ["group_name", "other_group_name"]
}
```

### Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|iam_user_name|Defines the name of an account.|string|``|yes|
|iam_user_keybase_username|[keybase.io](https://keybase.io) username.|string|``|yes|
|iam_user_groups|Defines a list of existing groups to which account will be added.|list|`[]`|no|
|iam_user_policies_arns_list|A list of the policies attached to the new account.|list|`[]`|no|

### Outputs

| Name | Description |
|------|-------------|
|user_password|Returns account's password in encrypted, through provided keybase.io account's PGP public key, way.|

