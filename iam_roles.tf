resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "s3-role"
  assume_role_policy = file("assumerolepolicy.json")
}

resource "aws_iam_instance_profile" "ec2_profile_s3" {
  name = "ec2_profile_s3"
  role = aws_iam_role.ec2_s3_access_role.name
}

resource "aws_iam_policy" "policy" {
  name        = "ec2_access_full_s3_policy"
  description = "Poliyc Certification SAA-C03"

  policy = file("policys3bucket.json")
}
#
resource "aws_iam_policy_attachment" "ec2-s3-attach" {
  name       = "ec2-s3-attach"
  roles      = [aws_iam_role.ec2_s3_access_role.name]
  policy_arn = aws_iam_policy.policy.arn

}
         