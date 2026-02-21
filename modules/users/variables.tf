variable "users" {
  type = map(object({
    email        = string
    display_name = string
  }))
}
