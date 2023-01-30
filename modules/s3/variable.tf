variable "domain" {
  type        = string
  description = "Bucket domain name"
}

variable "tags" {
  type        = map(any)
  description = "Tags used to identify the resources"
}