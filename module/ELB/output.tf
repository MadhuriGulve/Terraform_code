output "load_balancers" {
    value = aws_elb.web_elb.id
}