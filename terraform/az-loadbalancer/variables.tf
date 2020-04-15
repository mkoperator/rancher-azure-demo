variable "prefix" {
  description = "ip configuration name prefix"
}

variable "resource-group" {
  description = "Resource group for the front end load balancer."
}

variable "domain-name-label" {
  description = "Domain name label for the front end load balancer"
  type = string
}

variable "backend-nics" {
  description = "NICs to send traffic from the front end"
  type = list(any)
}
