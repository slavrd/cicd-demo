output "website-endpoints" {
  value = "${aws_s3_bucket.s3bucket-web.*.website_endpoint}"
}

output "s3-bucket-names" {
  value = "${aws_s3_bucket.s3bucket-web.*.id}"
}

output "iam-user-access-key-id" {
  value = "${aws_iam_access_key.deploy.id}"
}

output "iam-user-secret-key-plain" {
  value = "${join("",aws_iam_access_key.deploy.*.secret)}"
}

output "iam-user-name" {
  value = "${aws_iam_user.deploy.name}"
}
