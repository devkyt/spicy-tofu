output "vpc_id" {
  description = "The id of created VPC"
  value       = aws_vpc.main.id
}
