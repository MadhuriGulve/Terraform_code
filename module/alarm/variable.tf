variable "name" {
  description = "Set a name for the sns topic"
  type = string
}

variable "alarm_name" {
  description = "Set a name for alarm"
  type = string
}

variable "comparison_operator" {
  description = "Set a value for threshold comparison"
  type = string
}

variable "evaluation_periods" {
  description = "Set a value for threshold comparison"
  type = number
}

variable "metric_name" {
  description = "Set a value for metric_name"
  type = string
}

variable "namespace" {
  description = "Set a value for namespace"
  type = string
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied"
  type = number
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric"
  type = string
}

variable "threshold" {
  description = "The value against which the specified statistic is compared"
  type = number
}

variable "insufficient_data_actions" {
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state"
  type = list
}

variable "alarm_description" {
  description = "The description for the alarm"
  type = string
}

variable "protocol" {
  description = "subscription protocol"
  type = string
}

variable "endpoint" {
  description = "subscription endpoint"
  type = string
}

