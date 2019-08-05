view: customer {
  sql_table_name: dbo.Customer ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: country {
    label: "PIA Country"
    drill_fields: [city]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }
  # { Parameter Test
  # Testing parameter option below
  parameter: SelectRegion{
    type: string
    allowed_value: {
      value: "Country"
    }
    allowed_value: {
      value: "City"
    }
  }

  # Created below dimension to utilize above parameter
  dimension: ParamRegion {
    label_from_parameter: SelectRegion
    sql:
    CASE
      WHEN {% parameter SelectRegion %}  = 'Country'
      THEN ${country}
      WHEN {% parameter SelectRegion %}  = 'City'
      THEN ${city}
      ELSE
      NULL
      END
    ;;
  }

  # } Parameter Test End

  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, order.count]
  }

  measure: unique_customer_count {
    type: count_distinct
    sql: ${id} ;;
  }
}
