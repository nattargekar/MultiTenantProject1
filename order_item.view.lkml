view: order_item {

  sql_table_name: dbo.OrderItem ;;


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.OrderId ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ProductId ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.UnitPrice ;;
  }

  measure: count {
    type: count
    drill_fields: [id, order.id, product.id, product.product_name]
  }

  dimension: My_tiers {
    type: tier
    tiers: [0,20,40,60,80]
    style: integer
    sql: ${quantity} ;;
  }
}
