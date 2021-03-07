resource "aws_sns_topic" "test_topic" {
  name = var.name
}

resource "aws_sns_topic_subscription" "test_subscription" {
  topic_arn = aws_sns_topic.test_topic.arn
  protocol  = var.protocol
  endpoint  = var.endpoint
}

resource "aws_cloudwatch_metric_alarm" "volume_alarm" {
  alarm_name                = var.alarm_name
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  metric_name               = var.metric_name
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.threshold
  alarm_description         = var.alarm_description
  insufficient_data_actions = var.insufficient_data_actions
}