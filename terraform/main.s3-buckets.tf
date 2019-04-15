resource "aws_s3_bucket" "s3bucket-web" {
  count         = "${length(var.env-designations)}"
  bucket        = "${var.buckets-name-prefix}-${element(var.env-designations, count.index)}"
  acl           = "public-read"
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_policy" "s3bucket-web-policy" {
  count  = "${length(var.env-designations)}"
  bucket = "${element(aws_s3_bucket.s3bucket-web.*.id, count.index)}"

  policy = "${element(data.template_file.s3bucket-web-policy.*.rendered, count.index)}"
}

data "template_file" "s3bucket-web-policy" {
  count    = "${length(var.env-designations)}"
  template = "${file("files/s3-bucket-policy.template.json")}"

  vars = {
    bucket_name = "${element(aws_s3_bucket.s3bucket-web.*.id, count.index)}"
  }
}
