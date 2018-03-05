# The AWS region in which the poudriere builder will run.
variable region {}
# The awscli credentials profile to use. See `aws configure help`
variable profile {}

# The availability zone in which to create volumes and instances.
variable availability-zone {}

# The name for public ssh key pair. The key data itself is expected to
# be found in a file of the same name with the .pub suffix.
variable public_key_name {}
