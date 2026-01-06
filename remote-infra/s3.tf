resource "aws_s3_bucket" "remote_s3" {
  bucket = "tws-junoon-bucket-9151"

  tags = {
    Name        = "tws-junoon-state-bucket"
    
  }
}