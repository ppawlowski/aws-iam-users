locals {
  obligatory_user_policies = ["arn:aws:iam::aws:policy/IAMUserChangePassword"]
  full_list_of_user_policies = concat(local.obligatory_user_policies, var.iam_user_policies_arns_list)
}

resource "aws_iam_user" "user" {
  name = var.iam_user_name
  path = "/"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "login_profile" {
  pgp_key = "keybase:${var.iam_user_keybase_username}"
  user = aws_iam_user.user.name

  lifecycle {
    ignore_changes = [password_length, password_reset_required, pgp_key]
  }
}

resource "aws_iam_user_group_membership" "group_membership" {
  groups = var.iam_user_groups
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy_attachment" "default_user_policy" {
  count = length(local.full_list_of_user_policies)
  policy_arn = element(local.full_list_of_user_policies, count.index)
  user = aws_iam_user.user.name
}