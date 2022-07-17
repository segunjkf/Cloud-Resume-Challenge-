
resource "aws_s3_bucket" "static" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy =  templatefile("template/s3-public-json.json", { bucket = var.bucket_name })
  force_destroy = true
  
}


output "website_endpoint" {
  value = aws_s3_bucket.static.bucket_regional_domain_name
  }
 
output "website_endpoint_root" {
  value = aws_s3_bucket.root_static.bucket_regional_domain_name
  }
resource "aws_s3_bucket" "root_static" {
  bucket = "root-${var.bucket_name}"
  acl    = "public-read"
  policy =  templatefile("template/s3-public-json.json", { bucket = "root-${var.bucket_name}" })
  force_destroy = true
   website {
    redirect_all_requests_to = aws_s3_bucket.static.bucket_regional_domain_name

}
}
