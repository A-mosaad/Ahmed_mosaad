provider "aws" {
    shared_config_files      = ["/root/config"]
    shared_credentials_files = ["/root/cred"]
    profile                  = "dev"
    region = "us-east-1" 
}
