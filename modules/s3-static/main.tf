resource "aws_s3_bucket" "static" {
  bucket        = var.bucket_name
  acl           = "public-read"
  policy        = templatefile("template/s3-public-json.json", { bucket = var.bucket_name })
  
  force_destroy = true

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["*"]
    max_age_seconds = 10
  }

  website {
    index_document = "index.html"
    error_document = "404.html"

  }
}


output "website_endpoint" {
  value = aws_s3_bucket.static.bucket_regional_domain_name
}

output "website_endpoint_root" {
  value = aws_s3_bucket.root_static.bucket_regional_domain_name
}

resource "aws_s3_bucket" "root_static" {
  bucket        = "root-${var.bucket_name}"
  acl           = "public-read"
  policy        = templatefile("template/s3-public-json.json", { bucket = "root-${var.bucket_name}" })
  
  force_destroy = true
  
  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["*"]
    max_age_seconds = 10
  }

  website {
    redirect_all_requests_to = aws_s3_bucket.static.bucket_regional_domain_name
  }
}
