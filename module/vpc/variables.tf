variable "availabilityZone" {
        default = ["us-east-1a", "us-east-1b"]
}
variable "instanceTenancy" {
 default = "default"
}
variable "dnsSupport" {
 default = true
}
variable "dnsHostNames" {
        default = true
}
variable "vpcCIDRblock" {
 default = "30.0.0.0/16"
}
variable "subnetCIDRblock1" {
        default = "30.0.1.0/24"
}
variable "subnetCIDRblock2" {
        default = "30.0.2.0/24"
}
variable "destinationCIDRblock" {
        default = "0.0.0.0/0"
}
variable "mapPublicIP" {
        default = true
}
