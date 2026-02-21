resource "databricks_group" "this" {
  for_each = var.groups

  display_name = each.key
}

resource "databricks_group_member" "members" {

  for_each = {
    for item in flatten([
      for group, members in var.groups : [
        for member in members : {
          key    = "${group}-${member}"
          group  = group
          member = member
        }
      ]
    ]) : item.key => item
  }

  group_id  = databricks_group.this[each.value.group].id
  member_id = var.user_ids[each.value.member]
}
