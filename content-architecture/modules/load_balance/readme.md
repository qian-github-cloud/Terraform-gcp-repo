- about Global external HTTPS load balancer
[https://cloud.google.com/load-balancing/docs/https]
1. proxy-only subnet
- 
2. external forwarding rule
- 
3. target https proxy
- module load_balance
4. SSL certificate
- Terraform function
- module load_balance
5. URL map
- module load_balance
6. backend service
- module load_balance
7. health check
- module instance_group
8. firewall rule
- module firewall