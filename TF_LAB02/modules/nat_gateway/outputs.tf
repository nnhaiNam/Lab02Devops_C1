output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}

# Output for Elastic IP assigned to the NAT Gateway
output "nat_gateway_eip" {
  value = aws_eip.nat.public_ip
}
