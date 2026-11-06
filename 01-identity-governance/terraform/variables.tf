variable "subscription_id" {
  description = "Azure subscription that holds the Hylia Logistics sandbox."
  type        = string
}

variable "admin_object_id" {
  description = "Entra object ID of the day-to-day admin account that gets PIM eligible roles."
  type        = string
}
