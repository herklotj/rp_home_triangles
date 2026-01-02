view: lk_h_policy_history_scored {
    sql_table_name: dbuser.sas_h_policy_history_scored ;;

  dimension: home_cover_level {
    type: string
    sql: home_cover_level;;
  }

  dimension: cfi_ind {
    type: number
    sql: cfi_ind;;
  }

  dimension: aauicl_ind_bds {
    type: number
    sql: aauicl_ind_bds;;
  }

  dimension: aauicl_ind_cts {
    type: number
    sql: aauicl_ind_cts;;
  }


  measure: table_last_refreshed_date {
    type: date_time
    sql: max(load_dttm) ;;
  }

  measure: inforce_yesterday {
    type: number
    sql:
    SUM(CASE WHEN to_date (schedule_cover_start_dttm) < to_date (sysdate) -1 AND to_date (schedule_cover_end_dttm) >= to_date (sysdate) -1 THEN 1 ELSE 0 END) ;;
    value_format: "#,##0"
  }

  measure: inforce_8_days_ago {
    type: number
    sql:
    SUM(CASE WHEN to_date (schedule_cover_start_dttm) < to_date (sysdate) -8 AND to_date (schedule_cover_end_dttm) >= to_date (sysdate) -8 THEN 1 ELSE 0 END) ;;
    value_format: "#,##0"
  }

  measure: inforce_15_days_ago {
    type: number
    sql:
    SUM(CASE WHEN to_date (schedule_cover_start_dttm) < to_date (sysdate) -15 AND to_date (schedule_cover_end_dttm) >= to_date (sysdate) -15 THEN 1 ELSE 0 END) ;;
    value_format: "#,##0"
  }

  measure: inforce_30_days_ago {
    type: number
    sql:
    SUM(CASE WHEN to_date (schedule_cover_start_dttm) < to_date (sysdate) -30 AND to_date (schedule_cover_end_dttm) >= to_date (sysdate) -30 THEN 1 ELSE 0 END) ;;
    value_format: "#,##0"
  }


  measure: inforce_at_end_of_last_month{
    label: "Last Month"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '1' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '1' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }

  measure: inforce_2_months_ago{
    label: "2 Months Ago"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '2' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '2' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }

  measure: inforce_3_months_ago{
    label: "3 Months Ago"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '3' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '3' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }

  measure: inforce_4_months_ago{
    label: "4 Months Ago"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '4' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '4' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }

  measure: inforce_5_months_ago{
    label: "5 Months Ago"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '5' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '5' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }

  measure: inforce_6_months_ago{
    label: "6 Months Ago"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '6' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '6' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }

  measure: inforce_7_months_ago{
    label: "7 Months Ago"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '7' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '7' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }

  measure: inforce_8_months_ago{
    label: "8 Months Ago"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '8' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '8' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }


  measure: inforce_9_months_ago{
    label: "9 Months Ago"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '9' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '9' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }


  measure: inforce_10_months_ago{
    label: "10 Months Ago"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '10' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '10' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }


  measure: inforce_11_months_ago{
    label: "11 Months Ago"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '11' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '11' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }


  measure: inforce_12_months_ago{
    label: "12 Months Ago"
    type: number
    sql: SUM(CASE WHEN TO_DATE(schedule_cover_start_dttm) < LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '12' MONTH)
             AND TO_DATE(schedule_cover_end_dttm) >= LAST_DAY(TO_DATE(SYSDATE) - INTERVAL '12' MONTH) THEN 1 ELSE 0 END);;
    value_format: "#,##0"
  }

  }
