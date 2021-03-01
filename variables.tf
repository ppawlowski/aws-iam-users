variable "iam_user_name" {
  type = string
  description = "Defines the name of an account."
}

variable "iam_user_keybase_username" {
  type = string
  description = "keybase.io username."
}

variable "iam_user_groups" {
  type = list(string)
  description = "A list of existing groups to which account will be added."
  default = []
}

variable "iam_user_policies_arns_list" {
  type = list(string)
  description = "A list of the policies attached to the new account."
  default = []
}