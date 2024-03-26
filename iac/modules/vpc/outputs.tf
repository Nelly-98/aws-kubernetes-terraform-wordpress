output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnets_ids" {
  value = aws_subnet.public.*.id
}

output "rds_subnet_group_name" {
  value = aws_db_subnet_group.rds.name
}



