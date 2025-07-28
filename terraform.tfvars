ami = "ami-00e3c023f0084cbfb"
key_name = "MumbaiKeyPair"


instances = {
  inst1 = {
    az   = "ap-south-1a"
    tag  = "public-subnet-1a"
    name = "terraform"
  }
jenkins = {
    az            = "ap-south-1a"
    tag           = "jenkins-server"
    name          = "jenkins"
    instance_type = "t3.small"
  }
}
