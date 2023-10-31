view: lk_h_reserving_triangles {
  sql_table_name: actian.lk_h_reserving_triangles ;;

  dimension_group: load_datetime {
    type: time
    timeframes: [
      time,
      date,
      month,
      quarter,
      year,
      fiscal_quarter,
      fiscal_year
    ]
    sql: cast(${TABLE}.load_dttm as timestamp) ;;
    hidden: yes
  }

  dimension: load_mth_formatted {
    sql: ${load_datetime_month} ;;
    html: {{ rendered_value | append: "-01" | date: "%B %Y" }};;
  }

  dimension_group: acc_month {
    type: time
    timeframes: [
      month,
      quarter,
      year,
      fiscal_quarter,
      fiscal_year
    ]
    sql: cast(${TABLE}.acc_month as timestamp) ;;
    label: "Accident Period"
  }


  dimension_group: dev_month {
    type: time
    timeframes: [
      month,
      quarter,
      year,
      fiscal_quarter,
      fiscal_year
    ]
    sql: cast(${TABLE}.dev_month as timestamp) ;;
    label: "Development Period"
  }

  dimension: dev {
    type: number
    sql: ${TABLE}.dev ;;
  }

  dimension: fuw_year {
    type: string
    sql: concat('FY',${TABLE}.fuw_year) ;;
    label: "FUW Year"
  }

  dimension: uw_year {
    type: number
    sql: ${TABLE}.uw_year ;;
    label: "UW Year"
  }

  dimension: uw_year_dev_month {
    type: number
    sql: case when ${TABLE}.uw_year = '1' then months_between(${TABLE}.dev_month,'2016-08-01')+1
              when ${TABLE}.uw_year = '2' then months_between(${TABLE}.dev_month,'2017-08-01')+1
              when ${TABLE}.uw_year = '3' then months_between(${TABLE}.dev_month,'2018-08-01')+1
              when ${TABLE}.uw_year = '4' then months_between(${TABLE}.dev_month,'2019-08-01')+1
              when ${TABLE}.uw_year = '5' then months_between(${TABLE}.dev_month,'2020-08-01')+1
              when ${TABLE}.uw_year = '6' then months_between(${TABLE}.dev_month,'2021-08-01')+1
              when ${TABLE}.uw_year = '7' then months_between(${TABLE}.dev_month,'2022-08-01')+1
              when ${TABLE}.uw_year = '8' then months_between(${TABLE}.dev_month,'2023-08-01')+1
              when ${TABLE}.uw_year = '9' then months_between(${TABLE}.dev_month,'2024-08-01')+1
              when ${TABLE}.uw_year = '10' then months_between(${TABLE}.dev_month,'2025-08-01')+1
              else null end   ;;
    label: "UW Year Dev"
  }

  dimension: fuw_year_dev_month {
    type: number
    sql: case when ${TABLE}.fuw_year = '2017' then months_between(${TABLE}.dev_month,'2016-02-01')+1
              when ${TABLE}.fuw_year = '2018' then months_between(${TABLE}.dev_month,'2017-02-01')+1
              when ${TABLE}.fuw_year = '2019' then months_between(${TABLE}.dev_month,'2018-02-01')+1
              when ${TABLE}.fuw_year = '2020' then months_between(${TABLE}.dev_month,'2019-02-01')+1
              when ${TABLE}.fuw_year = '2021' then months_between(${TABLE}.dev_month,'2020-02-01')+1
              when ${TABLE}.fuw_year = '2022' then months_between(${TABLE}.dev_month,'2021-02-01')+1
              when ${TABLE}.fuw_year = '2023' then months_between(${TABLE}.dev_month,'2022-02-01')+1
              when ${TABLE}.fuw_year = '2024' then months_between(${TABLE}.dev_month,'2023-02-01')+1
              when ${TABLE}.fuw_year = '2025' then months_between(${TABLE}.dev_month,'2024-02-01')+1
              when ${TABLE}.fuw_year = '2026' then months_between(${TABLE}.dev_month,'2025-02-01')+1
              else null end   ;;
    label: "FUW Year Dev"
  }

  dimension: acc_year_dev_month {
    type: number
    sql: case when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2016-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2016-02-01' ))))) then months_between(${TABLE}.dev_month,'2016-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2017-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2017-02-01' ))))) then months_between(${TABLE}.dev_month,'2017-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2018-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2018-02-01' ))))) then months_between(${TABLE}.dev_month,'2018-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2019-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2019-02-01' ))))) then months_between(${TABLE}.dev_month,'2019-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2020-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2020-02-01' ))))) then months_between(${TABLE}.dev_month,'2020-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2021-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2021-02-01' ))))) then months_between(${TABLE}.dev_month,'2021-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2022-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2022-02-01' ))))) then months_between(${TABLE}.dev_month,'2022-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2023-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2023-02-01' ))))) then months_between(${TABLE}.dev_month,'2023-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2024-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2024-02-01' ))))) then months_between(${TABLE}.dev_month,'2024-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2025-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2025-02-01' ))))) then months_between(${TABLE}.dev_month,'2025-02-01')+1
    else null end   ;;
    label: "Accident Year Dev"
  }


  dimension: acc_quarter_dev_month {
    type: number
    sql: case
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2016-08-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2016-08-01' ))))) then months_between(${TABLE}.dev_month,'2016-08-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2016-11-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2016-11-01' ))))) then months_between(${TABLE}.dev_month,'2016-11-01')+1

    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2017-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2017-02-01' ))))) then months_between(${TABLE}.dev_month,'2017-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2017-05-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2017-05-01' ))))) then months_between(${TABLE}.dev_month,'2017-05-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2017-08-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2017-08-01' ))))) then months_between(${TABLE}.dev_month,'2017-08-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2017-11-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2017-11-01' ))))) then months_between(${TABLE}.dev_month,'2017-11-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2018-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2018-02-01' ))))) then months_between(${TABLE}.dev_month,'2018-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2018-05-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2018-05-01' ))))) then months_between(${TABLE}.dev_month,'2018-05-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2018-08-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2018-08-01' ))))) then months_between(${TABLE}.dev_month,'2018-08-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2018-11-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2018-11-01' ))))) then months_between(${TABLE}.dev_month,'2018-11-01')+1

    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2019-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2019-02-01' ))))) then months_between(${TABLE}.dev_month,'2019-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2019-05-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2019-05-01' ))))) then months_between(${TABLE}.dev_month,'2019-05-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2019-08-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2019-08-01' ))))) then months_between(${TABLE}.dev_month,'2019-08-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2019-11-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2019-11-01' ))))) then months_between(${TABLE}.dev_month,'2019-11-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2020-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2020-02-01' ))))) then months_between(${TABLE}.dev_month,'2020-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2020-05-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2020-05-01' ))))) then months_between(${TABLE}.dev_month,'2020-05-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2020-08-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2020-08-01' ))))) then months_between(${TABLE}.dev_month,'2020-08-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2020-11-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2020-11-01' ))))) then months_between(${TABLE}.dev_month,'2020-11-01')+1

    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2021-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2021-02-01' ))))) then months_between(${TABLE}.dev_month,'2021-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2021-05-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2021-05-01' ))))) then months_between(${TABLE}.dev_month,'2021-05-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2021-08-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2021-08-01' ))))) then months_between(${TABLE}.dev_month,'2021-08-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2021-11-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2021-11-01' ))))) then months_between(${TABLE}.dev_month,'2021-11-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2022-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2022-02-01' ))))) then months_between(${TABLE}.dev_month,'2022-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2022-05-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2022-05-01' ))))) then months_between(${TABLE}.dev_month,'2022-05-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2022-08-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2022-08-01' ))))) then months_between(${TABLE}.dev_month,'2022-08-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2022-11-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2022-11-01' ))))) then months_between(${TABLE}.dev_month,'2022-11-01')+1

    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2023-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2023-02-01' ))))) then months_between(${TABLE}.dev_month,'2023-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2023-05-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2023-05-01' ))))) then months_between(${TABLE}.dev_month,'2023-05-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2023-08-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2023-08-01' ))))) then months_between(${TABLE}.dev_month,'2023-08-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2023-11-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2023-11-01' ))))) then months_between(${TABLE}.dev_month,'2023-11-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2024-02-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2024-02-01' ))))) then months_between(${TABLE}.dev_month,'2024-02-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2024-05-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2024-05-01' ))))) then months_between(${TABLE}.dev_month,'2024-05-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2024-08-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2024-08-01' ))))) then months_between(${TABLE}.dev_month,'2024-08-01')+1
    when (((cast(lk_h_reserving_triangles.acc_month as timestamp) ) >= ((TIMESTAMP '2024-11-01')) AND (cast(lk_h_reserving_triangles.acc_month as timestamp) ) < ((TIMESTAMPADD(month,3, TIMESTAMP '2024-11-01' ))))) then months_between(${TABLE}.dev_month,'2024-11-01')+1
    else null end   ;;
    label: "Accident Quarter Dev"
  }

  dimension: cat_period {
    type: string
    sql: case when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2016-08-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2017-10-01')))
                    then 'Aug16 - Sep17'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2017-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2018-10-01')))
                    then 'Oct17 - Sep18'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2018-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2019-10-01')))
                    then 'Oct18 - Sep19'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2019-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2020-10-01')))
                    then 'Oct19 - Sep20'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2020-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2021-10-01')))
                    then 'Oct20 - Sep21'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2021-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2022-10-01')))
                    then 'Oct21 - Sep22'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2022-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2023-10-01')))
                    then 'Oct22 - Sep23'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2023-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2024-10-01')))
                    then 'Oct23 - Sep24'
              else null end   ;;
    label: "Cat Period"
  }


  ### Measures

  measure: sum_paid {
    label: "Paid"
    type:  sum
    sql: ${TABLE}.sum_paid ;;
    value_format_name: decimal_0
  }

  measure: sum_outstanding {
    label: "Outstanding"
    type:  sum
    sql: ${TABLE}.sum_outstanding ;;
    value_format_name: decimal_0
  }

  measure: sum_incurred {
    label: "Incurred"
    type:  sum
    sql: ${TABLE}.sum_incurred ;;
    value_format_name: decimal_0
  }

  measure: sum_paid_s {
    label: "Paid (settled)"
    type:  sum
    sql: ${TABLE}.sum_paid_s ;;
    value_format_name: decimal_0
  }

  measure: sum_non_nil {
    label: "Non Nil"
    type:  sum
    sql: ${TABLE}.sum_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_nil {
    label: "Nil"
    type:  sum
    sql: ${TABLE}.sum_nil ;;value_format_name: decimal_0
  }

  measure: sum_non_nil_s {
    label: "Non Nil (settled)"
    type:  sum
    sql: ${TABLE}.sum_non_nil_s ;;value_format_name: decimal_0
  }

  measure: sum_nil_s {
    label: "Nil (settled)"
    type:  sum
    sql: ${TABLE}.sum_nil_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_paid {
    label: "Paid - BDS"
    type:  sum
    sql: ${TABLE}.sum_bds_paid ;;value_format_name: decimal_0
  }

  measure: sum_bds_outstanding {
    label: "Outstanding - BDS"
    type:  sum
    sql: ${TABLE}.sum_bds_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_bds_incurred {
    label: "Incured - BDS"
    type:  sum
    sql: ${TABLE}.sum_bds_incurred ;;value_format_name: decimal_0
  }

  measure: sum_bds_paid_s {
    label: "Paid - BDS (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_non_nil {
    label: "Non Nil - BDS"
    type:  sum
    sql: ${TABLE}.sum_bds_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_bds_non_nil_s {
    label: "Non Nil - BDS (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_non_nil_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_paid {
    label: "Paid - CTS"
    type:  sum
    sql: ${TABLE}.sum_cts_paid ;;value_format_name: decimal_0
  }

  measure: sum_cts_outstanding {
    label: "Outstanding - CTS"
    type:  sum
    sql: ${TABLE}.sum_cts_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_cts_incurred {
    label: "Incured - CTS"
    type:  sum
    sql: ${TABLE}.sum_cts_incurred ;;value_format_name: decimal_0
  }

  measure: sum_cts_paid_s {
    label: "Paid - CTS (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_non_nil {
    label: "Non Nil - CTS"
    type:  sum
    sql: ${TABLE}.sum_cts_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_cts_non_nil_s {
    label: "Non Nil - CTS (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_non_nil_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_ad_paid {
    label: "Paid - BDS AD"
    type:  sum
    sql: ${TABLE}.sum_bds_ad_paid ;;value_format_name: decimal_0
  }

  measure: sum_bds_ad_outstanding {
    label: "Outstanding - BDS AD"
    type:  sum
    sql: ${TABLE}.sum_bds_ad_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_bds_ad_incurred {
    label: "Incured - BDS AD"
    type:  sum
    sql: ${TABLE}.sum_bds_ad_incurred ;;value_format_name: decimal_0
  }

  measure: sum_bds_ad_paid_s {
    label: "Paid - BDS AD (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_ad_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_ad_non_nil {
    label: "Non Nil - BDS AD"
    type:  sum
    sql: ${TABLE}.sum_bds_ad_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_bds_ad_non_nil_s {
    label: "Non Nil - BDS AD (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_ad_non_nil_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_eow_paid {
    label: "Paid - BDS EoW"
    type:  sum
    sql: ${TABLE}.sum_bds_eow_paid ;;value_format_name: decimal_0
  }

  measure: sum_bds_eow_outstanding {
    label: "Outstanding - BDS EoW"
    type:  sum
    sql: ${TABLE}.sum_bds_eow_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_bds_eow_incurred {
    label: "Incured - BDS EoW"
    type:  sum
    sql: ${TABLE}.sum_bds_eow_incurred ;;value_format_name: decimal_0
  }

  measure: sum_bds_eow_paid_s {
    label: "Paid - BDS EoW (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_eow_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_eow_non_nil {
    label: "Non Nil - BDS EoW"
    type:  sum
    sql: ${TABLE}.sum_bds_eow_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_bds_eow_non_nil_s {
    label: "Non Nil - BDS EoW (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_eow_non_nil_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_fire_paid {
    label: "Paid - BDS Fire"
    type:  sum
    sql: ${TABLE}.sum_bds_fire_paid ;;value_format_name: decimal_0
  }

  measure: sum_bds_fire_outstanding {
    label: "Outstanding - BDS Fire"
    type:  sum
    sql: ${TABLE}.sum_bds_fire_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_bds_fire_incurred {
    label: "Incured - BDS Fire"
    type:  sum
    sql: ${TABLE}.sum_bds_fire_incurred ;;value_format_name: decimal_0
  }

  measure: sum_bds_fire_paid_s {
    label: "Paid - BDS Fire (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_fire_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_fire_non_nil {
    label: "Non Nil - BDS Fire"
    type:  sum
    sql: ${TABLE}.sum_bds_fire_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_bds_fire_non_nil_s {
    label: "Non Nil - BDS Fire (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_fire_non_nil_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_flood_paid {
    label: "Paid - BDS Flood"
    type:  sum
    sql: ${TABLE}.sum_bds_flood_paid ;;value_format_name: decimal_0
  }

  measure: sum_bds_flood_outstanding {
    label: "Outstanding - BDS Flood"
    type:  sum
    sql: ${TABLE}.sum_bds_flood_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_bds_flood_incurred {
    label: "Incured - BDS Flood"
    type:  sum
    sql: ${TABLE}.sum_bds_flood_incurred ;;value_format_name: decimal_0
  }

  measure: sum_bds_flood_paid_s {
    label: "Paid - BDS Flood (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_flood_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_flood_non_nil {
    label: "Non Nil - BDS Flood"
    type:  sum
    sql: ${TABLE}.sum_bds_flood_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_bds_flood_non_nil_s {
    label: "Non Nil - BDS Flood (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_flood_non_nil_s ;;value_format_name: decimal_0
  }



  measure: sum_bds_other_paid {
    label: "Paid - BDS Other"
    type:  sum
    sql: ${TABLE}.sum_bds_other_paid ;;value_format_name: decimal_0
  }

  measure: sum_bds_other_outstanding {
    label: "Outstanding - BDS Other"
    type:  sum
    sql: ${TABLE}.sum_bds_other_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_bds_other_incurred {
    label: "Incured - BDS Other"
    type:  sum
    sql: ${TABLE}.sum_bds_other_incurred ;;value_format_name: decimal_0
  }

  measure: sum_bds_other_paid_s {
    label: "Paid - BDS Other (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_other_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_other_non_nil {
    label: "Non Nil - BDS Other"
    type:  sum
    sql: ${TABLE}.sum_bds_other_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_bds_other_non_nil_s {
    label: "Non Nil - BDS Other (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_other_non_nil_s ;;value_format_name: decimal_0
  }


  measure: sum_bds_storm_paid {
    label: "Paid - BDS Storm"
    type:  sum
    sql: ${TABLE}.sum_bds_storm_paid ;;value_format_name: decimal_0
  }

  measure: sum_bds_storm_outstanding {
    label: "Outstanding - BDS Storm"
    type:  sum
    sql: ${TABLE}.sum_bds_storm_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_bds_storm_incurred {
    label: "Incured - BDS Storm"
    type:  sum
    sql: ${TABLE}.sum_bds_storm_incurred ;;value_format_name: decimal_0
  }

  measure: sum_bds_storm_paid_s {
    label: "Paid - BDS Storm (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_storm_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_storm_non_nil {
    label: "Non Nil - BDS Storm"
    type:  sum
    sql: ${TABLE}.sum_bds_storm_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_bds_storm_non_nil_s {
    label: "Non Nil - BDS Storm (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_storm_non_nil_s ;;value_format_name: decimal_0
  }


  measure: sum_bds_subsidence_paid {
    label: "Paid - BDS Subsidence"
    type:  sum
    sql: ${TABLE}.sum_bds_subsidence_paid ;;value_format_name: decimal_0
  }

  measure: sum_bds_subsidence_outstanding {
    label: "Outstanding - BDS Subsidence"
    type:  sum
    sql: ${TABLE}.sum_bds_subsidence_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_bds_subsidence_incurred {
    label: "Incured - BDS Subsidence"
    type:  sum
    sql: ${TABLE}.sum_bds_subsidence_incurred ;;value_format_name: decimal_0
  }

  measure: sum_bds_subsidence_paid_s {
    label: "Paid - BDS Subsidence (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_subsidence_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_subsidence_non_nil {
    label: "Non Nil - BDS Subsidence"
    type:  sum
    sql: ${TABLE}.sum_bds_subsidence_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_bds_subsidence_non_nil_s {
    label: "Non Nil - BDS Subsidence (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_subsidence_non_nil_s ;;value_format_name: decimal_0
  }


  measure: sum_bds_theft_paid {
    label: "Paid - BDS Theft"
    type:  sum
    sql: ${TABLE}.sum_bds_theft_paid ;;value_format_name: decimal_0
  }

  measure: sum_bds_theft_outstanding {
    label: "Outstanding - BDS Theft"
    type:  sum
    sql: ${TABLE}.sum_bds_theft_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_bds_theft_incurred {
    label: "Incured - BDS Theft"
    type:  sum
    sql: ${TABLE}.sum_bds_theft_incurred ;;value_format_name: decimal_0
  }

  measure: sum_bds_theft_paid_s {
    label: "Paid - BDS Theft (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_theft_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_bds_theft_non_nil {
    label: "Non Nil - BDS Theft"
    type:  sum
    sql: ${TABLE}.sum_bds_theft_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_bds_theft_non_nil_s {
    label: "Non Nil - BDS Theft (settled)"
    type:  sum
    sql: ${TABLE}.sum_bds_theft_non_nil_s ;;value_format_name: decimal_0
  }


  measure: sum_cts_ad_paid {
    label: "Paid - CTS AD"
    type:  sum
    sql: ${TABLE}.sum_cts_ad_paid ;;value_format_name: decimal_0
  }

  measure: sum_cts_ad_outstanding {
    label: "Outstanding - CTS AD"
    type:  sum
    sql: ${TABLE}.sum_cts_ad_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_cts_ad_incurred {
    label: "Incured - CTS AD"
    type:  sum
    sql: ${TABLE}.sum_cts_ad_incurred ;;value_format_name: decimal_0
  }

  measure: sum_cts_ad_paid_s {
    label: "Paid - CTS AD (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_ad_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_ad_non_nil {
    label: "Non Nil - CTS AD"
    type:  sum
    sql: ${TABLE}.sum_cts_ad_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_cts_ad_non_nil_s {
    label: "Non Nil - CTS AD (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_ad_non_nil_s ;;value_format_name: decimal_0
  }


  measure: sum_cts_eow_paid {
    label: "Paid - CTS EoW"
    type:  sum
    sql: ${TABLE}.sum_cts_eow_paid ;;value_format_name: decimal_0
  }

  measure: sum_cts_eow_outstanding {
    label: "Outstanding - CTS EoW"
    type:  sum
    sql: ${TABLE}.sum_cts_eow_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_cts_eow_incurred {
    label: "Incured - CTS EoW"
    type:  sum
    sql: ${TABLE}.sum_cts_eow_incurred ;;value_format_name: decimal_0
  }

  measure: sum_cts_eow_paid_s {
    label: "Paid - CTS EoW (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_eow_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_eow_non_nil {
    label: "Non Nil - CTS EoW"
    type:  sum
    sql: ${TABLE}.sum_cts_eow_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_cts_eow_non_nil_s {
    label: "Non Nil - CTS EoW (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_eow_non_nil_s ;;value_format_name: decimal_0
  }


  measure: sum_cts_fire_paid {
    label: "Paid - CTS Fire"
    type:  sum
    sql: ${TABLE}.sum_cts_fire_paid ;;value_format_name: decimal_0
  }

  measure: sum_cts_fire_outstanding {
    label: "Outstanding - CTS Fire"
    type:  sum
    sql: ${TABLE}.sum_cts_fire_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_cts_fire_incurred {
    label: "Incured - CTS Fire"
    type:  sum
    sql: ${TABLE}.sum_cts_fire_incurred ;;value_format_name: decimal_0
  }

  measure: sum_cts_fire_paid_s {
    label: "Paid - CTS Fire (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_fire_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_fire_non_nil {
    label: "Non Nil - CTS Fire"
    type:  sum
    sql: ${TABLE}.sum_cts_fire_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_cts_fire_non_nil_s {
    label: "Non Nil - CTS Fire (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_fire_non_nil_s ;;value_format_name: decimal_0
  }


  measure: sum_cts_flood_paid {
    label: "Paid - CTS Flood"
    type:  sum
    sql: ${TABLE}.sum_cts_flood_paid ;;value_format_name: decimal_0
  }

  measure: sum_cts_flood_outstanding {
    label: "Outstanding - CTS Flood"
    type:  sum
    sql: ${TABLE}.sum_cts_flood_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_cts_flood_incurred {
    label: "Incured - CTS Flood"
    type:  sum
    sql: ${TABLE}.sum_cts_flood_incurred ;;value_format_name: decimal_0
  }

  measure: sum_cts_flood_paid_s {
    label: "Paid - CTS Flood (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_flood_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_flood_non_nil {
    label: "Non Nil - CTS Flood"
    type:  sum
    sql: ${TABLE}.sum_cts_flood_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_cts_flood_non_nil_s {
    label: "Non Nil - CTS Flood (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_flood_non_nil_s ;;value_format_name: decimal_0
  }


  measure: sum_cts_other_paid {
    label: "Paid - CTS Other"
    type:  sum
    sql: ${TABLE}.sum_cts_other_paid ;;value_format_name: decimal_0
  }

  measure: sum_cts_other_outstanding {
    label: "Outstanding - CTS Other"
    type:  sum
    sql: ${TABLE}.sum_cts_other_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_cts_other_incurred {
    label: "Incured - CTS Other"
    type:  sum
    sql: ${TABLE}.sum_cts_other_incurred ;;value_format_name: decimal_0
  }

  measure: sum_cts_other_paid_s {
    label: "Paid - CTS Other (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_other_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_other_non_nil {
    label: "Non Nil - CTS Other"
    type:  sum
    sql: ${TABLE}.sum_cts_other_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_cts_other_non_nil_s {
    label: "Non Nil - CTS Other (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_other_non_nil_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_storm_paid {
    label: "Paid - CTS Storm"
    type:  sum
    sql: ${TABLE}.sum_cts_storm_paid ;;value_format_name: decimal_0
  }

  measure: sum_cts_storm_outstanding {
    label: "Outstanding - CTS Storm"
    type:  sum
    sql: ${TABLE}.sum_cts_storm_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_cts_storm_incurred {
    label: "Incured - CTS Storm"
    type:  sum
    sql: ${TABLE}.sum_cts_storm_incurred ;;value_format_name: decimal_0
  }

  measure: sum_cts_storm_paid_s {
    label: "Paid - CTS Storm (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_storm_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_storm_non_nil {
    label: "Non Nil - CTS Storm"
    type:  sum
    sql: ${TABLE}.sum_cts_storm_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_cts_storm_non_nil_s {
    label: "Non Nil - CTS Storm (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_storm_non_nil_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_theft_paid {
    label: "Paid - CTS Theft"
    type:  sum
    sql: ${TABLE}.sum_cts_theft_paid ;;value_format_name: decimal_0
  }

  measure: sum_cts_theft_outstanding {
    label: "Outstanding - CTS Theft"
    type:  sum
    sql: ${TABLE}.sum_cts_theft_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_cts_theft_incurred {
    label: "Incured - CTS Theft"
    type:  sum
    sql: ${TABLE}.sum_cts_theft_incurred ;;value_format_name: decimal_0
  }

  measure: sum_cts_theft_paid_s {
    label: "Paid - CTS Theft (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_theft_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_theft_non_nil {
    label: "Non Nil - CTS Theft"
    type:  sum
    sql: ${TABLE}.sum_cts_theft_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_cts_theft_non_nil_s {
    label: "Non Nil - CTS Theft (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_theft_non_nil_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_pps_paid {
    label: "Paid - CTS PPS"
    type:  sum
    sql: ${TABLE}.sum_cts_pps_paid ;;value_format_name: decimal_0
  }

  measure: sum_cts_pps_outstanding {
    label: "Outstanding - CTS PPS"
    type:  sum
    sql: ${TABLE}.sum_cts_pps_outstanding ;;value_format_name: decimal_0
  }

  measure: sum_cts_pps_incurred {
    label: "Incured - CTS PPS"
    type:  sum
    sql: ${TABLE}.sum_cts_pps_incurred ;;value_format_name: decimal_0
  }

  measure: sum_cts_pps_paid_s {
    label: "Paid - CTS PPS (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_pps_paid_s ;;value_format_name: decimal_0
  }

  measure: sum_cts_pps_non_nil {
    label: "Non Nil - CTS PPS"
    type:  sum
    sql: ${TABLE}.sum_cts_pps_non_nil ;;value_format_name: decimal_0
  }

  measure: sum_cts_pps_non_nil_s {
    label: "Non Nil - CTS PPS (settled)"
    type:  sum
    sql: ${TABLE}.sum_cts_pps_non_nil_s ;;value_format_name: decimal_0
  }

  measure: transactions {
    label: "Transactions"
    type:  sum
    sql: ${TABLE}.sum_transactions ;;value_format_name: decimal_0
  }

  measure: sum_ad_incurred {
    label: "Peril Incurred - AD"
    type:  sum
    sql: ${TABLE}.sum_bds_ad_incurred + ${TABLE}.sum_cts_ad_incurred ;;
    value_format_name: decimal_0
  }

  measure: sum_eow_incurred {
    label: "Peril Incurred - EoW"
    type:  sum
    sql: ${TABLE}.sum_bds_eow_incurred + ${TABLE}.sum_cts_eow_incurred ;;
    value_format_name: decimal_0
  }

  measure: sum_fire_incurred {
    label: "Peril Incurred - Fire"
    type:  sum
    sql: ${TABLE}.sum_bds_fire_incurred + ${TABLE}.sum_cts_fire_incurred ;;
    value_format_name: decimal_0
  }

  measure: sum_flood_incurred {
    label: "Peril Incurred - Flood"
    type:  sum
    sql: ${TABLE}.sum_bds_flood_incurred + ${TABLE}.sum_cts_flood_incurred ;;
    value_format_name: decimal_0
  }

  measure: sum_other_incurred {
    label: "Peril Incurred - Other"
    type:  sum
    sql: ${TABLE}.sum_bds_other_incurred + ${TABLE}.sum_cts_other_incurred ;;
    value_format_name: decimal_0
  }

  measure: sum_storm_incurred {
    label: "Peril Incurred - Storm"
    type:  sum
    sql: ${TABLE}.sum_bds_storm_incurred + ${TABLE}.sum_cts_storm_incurred ;;
    value_format_name: decimal_0
  }

  measure: sum_subs_incurred {
    label: "Peril Incurred - Subsidence"
    type:  sum
    sql: ${TABLE}.sum_bds_subsidence_incurred ;;
    value_format_name: decimal_0
  }

  measure: sum_theft_incurred {
    label: "Peril Incurred - Theft"
    type:  sum
    sql: ${TABLE}.sum_bds_theft_incurred + ${TABLE}.sum_cts_theft_incurred ;;
    value_format_name: decimal_0
  }

  measure: sum_pps_incurred {
    label: "Peril Incurred - PPS"
    type:  sum
    sql: ${TABLE}.sum_cts_pps_incurred ;;
    value_format_name: decimal_0
  }

  measure: sum_weather_incurred {
    label: "Incurred - Weather"
    type:  sum
    sql: ${TABLE}.sum_bds_storm_incurred + ${TABLE}.sum_cts_storm_incurred + ${TABLE}.sum_bds_flood_incurred + ${TABLE}.sum_cts_flood_incurred;;
    value_format_name: decimal_0
  }

  measure: sum_non_weather_incurred {
    label: "Incurred - Non-Weather"
    type:  sum
    sql: ${TABLE}.sum_bds_ad_incurred + ${TABLE}.sum_cts_ad_incurred + ${TABLE}.sum_bds_eow_incurred + ${TABLE}.sum_cts_eow_incurred +
         ${TABLE}.sum_bds_fire_incurred + ${TABLE}.sum_cts_fire_incurred + ${TABLE}.sum_bds_other_incurred + ${TABLE}.sum_cts_other_incurred +
         ${TABLE}.sum_bds_subsidence_incurred + ${TABLE}.sum_bds_theft_incurred + ${TABLE}.sum_cts_theft_incurred + ${TABLE}.sum_cts_pps_incurred ;;
    value_format_name: decimal_0
  }
}
