output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "This is the vpc id: "
}

output "public_instance_ip" {
  value = ["${aws_instance.ec2_instance.public_ip}"]
}

# Imprime la url de jenkins para conectarnos // print the url of the jenkins server / 
output "website_url" {
  value = join("", ["http://", aws_instance.ec2_instance.public_dns, ":", "8080"])
}

