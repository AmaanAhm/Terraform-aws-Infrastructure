#jumpbox
aws_profile    = "amaan"
region         = "ap-south-1"
custom_string  = "laravel-docker"
vpc_name       = "my-dev-vpc"
app_name       = "jumpbox"
environment    = "dev"
subnet_tag     = "subnet_type"
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDTsYh7zOV7H2uw5RBjrpx2bpgv1lgTQVbrJtr4Hxd4c8srIs855oRwgKMAUTvIiOCGISTy7zY51jX8hUrkVspUNkF5H7/doEe9gLF64X2XPEZwxsBddnbZhpUR4upcJmDCu8V3ngpK3IPWl7bobZms0Q2ZmfgTEfoYbzOrAeDTQx2PrxycY5vJfzfogI6J9sXzSTDqIWLr/PY1E8GW9iHiOOX2Qgy2DT/N7jXaXGDQgq3Gn2IcMXCcaZNerNxwnYcYAtFU5iF7IEPOustzBkmqxF3LCBwMVXVVpHs2CdoWEKiVtA6T6Sj8n/Vefa4WsjwEd4xfr56BIjJuNjiVKwL6tn9dBlngG4rMpG43/aQxHmfM/C1p85XTyiHkHDr79gQ+cGc85rq8waT+2stt/d8wlzd116On/kSGwaUkpwVqW3adA8yxE5gDNnXVA5qAMOshFIFEUGFZOOTjGHjA8eTr5iCdKi+WWMztjCdpX1arrZQSgqzdr1HJ6AgTqkV8qQTCgF+dEMbXbV96dDV0ef7BM5BC70VN/0Nyvgnhajfi/w5bYZo+OxH/Pt6xuUgFQ23Z4ZpeN5eJr/Kz/8ZIDp8oxuOkCJe2/ccOHrnopbrdtR9nzWgRHN2s++6msz211vba7ONOslWfV1dYLVuH5RP6qSZPPW8SvoI7NeRd0+8EwQ== ahm.amaan@gmail.com"
ssh_cidr_list  = ["14.99.195.66/32"]
image_id       = "ami-0dee22c13ea7a9a67"
instance_type_jumpbox = "t2.micro"
common_tags = {
  "owner"     = "ahm.amaan@gmail.com"
  "env"       = "dev"
  "terraform" = "true"
  "project"   = "jumpbox"
  "purpose"   = "networking"
}




