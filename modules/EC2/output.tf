output "public_ip_address" {
    value = aws_instance.instance_terraform
}

output "loadbalancer-dns-name" {
  value = aws_lb.load-balancer-terraform.dns_name
}