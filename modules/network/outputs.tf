output "subnet_id_dc_a" {
  description = "The ID my subnet"
  value       = aws_subnet.subnet_main_dc_a.id
}

output "vpc_main_dc" {
  description = ""
  value       = aws_vpc.vpc_main_dc.id
}
