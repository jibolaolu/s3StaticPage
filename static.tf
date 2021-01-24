resource "aws_s3_bucket" "static_website" {
  bucket        = var.bucketName
  acl           = "public-read"
  policy        = file("policy.json")
  force_destroy = var.force_destroy

  tags = {
    Name = "SeunStaticPage"
  }

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = var.bucketName
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
  acl          = "public-read"
}