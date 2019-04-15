resource "aws_iam_user" "deploy" {
  name = "${var.iam-username}"
}

resource "aws_iam_user_policy" "deploy" {
  name = "tf-${var.iam-username}"
  user = "${aws_iam_user.deploy.name}"

  policy = "${data.template_file.iam-user-policy.rendered}"
}

data "template_file" "iam-user-policy" {
  template = "${file("files/deploy-user-policy.json")}"

  vars = {
    bucket_list = "${join("\",\"", formatlist("%s/*", aws_s3_bucket.s3bucket-web.*.arn))}"
  }
}

resource "aws_iam_access_key" "deploy" {
  user = "${aws_iam_user.deploy.name}"
}
