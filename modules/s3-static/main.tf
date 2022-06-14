
resource "aws_s3_bucket" "static" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy =  templatefile("template/s3-public-json.json", { bucket = var.bucket_name })
  force_destroy = true
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["http://wwwbucketname1233.s3-website-eu-west-1.amazonaws.com"]
    max_age_seconds = 3000

  }
   website {
    index_document = "index.html"
    error_document = "error.html"


}
}


output "website_endpoint" {
  value = aws_s3_bucket.static.bucket_regional_domain_name
  }
 

resource "aws_s3_bucket" "root_static" {
  bucket = "root-${var.bucket_name}"
  acl    = "public-read"
  policy =  templatefile("template/s3-public-json.json", { bucket = "root-${var.bucket_name}" })
  force_destroy = true
   website {
    redirect_all_requests_to = "http://wwwbucketname1233.s3-website-eu-west-1.amazonaws.com"


}
}
