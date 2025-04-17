resource "aws_iam_group" "sysadmin" {
  name = "SysAdmin"
}

resource "aws_iam_group_policy_attachment" "sysadmin" {
  group      = aws_iam_group.sysadmin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group" "dbadmin" {
  name = "DBAdmin"
}

resource "aws_iam_group_policy_attachment" "dbadmin" {
  group      = aws_iam_group.dbadmin.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator"
}

resource "aws_iam_group" "monitoring" {
  name = "Monitoring"
}

resource "aws_iam_group_policy_attachment" "monitoring1" {
  group      = aws_iam_group.monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "monitoring2" {
  group      = aws_iam_group.monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "monitoring3" {
  group      = aws_iam_group.monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
}