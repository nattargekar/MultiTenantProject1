connection: "deftdb"

include: "*.view.lkml"                       # include all views in this project

datagroup: nileshfirstproject_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: nileshfirstproject_default_datagroup


explore: order {


  label: "Orders"
  join: customer {
    type: left_outer
    sql_on: ${order.customer_id} = ${customer.id} ;;
    relationship: one_to_many
  }

  join: order_item {
    type:  left_outer
    sql_on: ${order.id} = ${order_item.order_id} ;;
    relationship: one_to_many
  }

}
