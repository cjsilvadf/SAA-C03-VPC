#####################
## Key Pair - Main ##
#####################
# Create the Key Pair
resource "aws_key_pair" "key_pair" {
  key_name   = "saa-c03-${lower(local.regions.main)}"
  public_key = tls_private_key.key_pair.public_key_openssh
}

# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save file
resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.key_pair.key_name}.pem"
  content  = tls_private_key.key_pair.private_key_pem
}