resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name}-${var.environment}-${random_id.suffix.hex}"

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
