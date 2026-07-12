# 5. On affiche l'ARN du bucket S3 créé ci-dessus.
output "bucket_arn" {
  value = aws_s3_bucket.mon_premier_bucket.arn # ← on affiche l'ARN après création
}