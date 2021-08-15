variable "subnets" {
   description = "alb subnet_id"
   type = list(string)
 }

 variable "security_groups" {
  description = "alb security_groups"
  type = string
}