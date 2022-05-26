output "vpc_network_name" {
  value = module.vpc.vpc_network_id
}

output "vpc_network_self_link" {
  value = module.vpc.vpc_network_self_link
}


output "vpc_subnet_name" {
  value = module.vpc.vpc_subnet_name
}

output "vpc_subnet_self_link" {
  value = module.vpc.vpc_subnet_self_link

}
