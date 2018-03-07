output "vm_ip_1" {
    value="${aws_instance.webtier-1.public_ip}"
}

output "vm_ip_2" {
    value="${aws_instance.webtier-2.public_ip}"
}

