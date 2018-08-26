variable "availabilityZone" {
        default = "us-east-1a"
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
variable "subnetCIDRblock" {
        default = "30.0.1.0/24"
}
variable "destinationCIDRblock" {
        default = "0.0.0.0/0"
}
variable "mapPublicIP" {
        default = true
}
