output "public_ip_address" {
    value = aws_instance.gokul_instance_terraform
}

output "loadbalancer-dns-name" {
  value = aws_lb.gokul-load-balancer-terraform.dns_name
}