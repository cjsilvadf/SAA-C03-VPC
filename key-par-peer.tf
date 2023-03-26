#####################
## Key Pair - Peer ##
#####################
# Create the Key Pair
resource "aws_key_pair" "peer" {
  provider   = aws.peer
  key_name   = "saa-c03-${lower(local.regions.peer)}"
  public_key = tls_private_key.key_pair.public_key_openssh
}

# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "peer" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save file
resource "local_file" "peer" {
  filename = "${aws_key_pair.peer.key_name}.pem"
  content  = tls_private_key.peer.private_key_pem
}