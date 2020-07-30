view: lk_h_reserving_vectors {
  sql_table_name: actian.lk_h_reserving_vectors ;;

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

  dimension: fuw_year {
    type: number
    sql: ${TABLE}.fuw_year ;;
    label: "FUW Year"
  }

  dimension: uw_year {
    type: number
    sql: ${TABLE}.uw_year ;;
    label: "UW Year"
  }

  dimension: uw_year_dev_month {
    type: number
    sql: case when ${TABLE}.uw_year = '1' then months_between(${TABLE}.acc_month,'2016-08-01')+1
              when ${TABLE}.uw_year = '2' then months_between(${TABLE}.acc_month,'2017-08-01')+1
              when ${TABLE}.uw_year = '3' then months_between(${TABLE}.acc_month,'2018-08-01')+1
              when ${TABLE}.uw_year = '4' then months_between(${TABLE}.acc_month,'2019-08-01')+1
              when ${TABLE}.uw_year = '5' then months_between(${TABLE}.acc_month,'2020-08-01')+1
              when ${TABLE}.uw_year = '6' then months_between(${TABLE}.acc_month,'2021-08-01')+1
              when ${TABLE}.uw_year = '7' then months_between(${TABLE}.acc_month,'2022-08-01')+1
              when ${TABLE}.uw_year = '8' then months_between(${TABLE}.acc_month,'2023-08-01')+1
              when ${TABLE}.uw_year = '9' then months_between(${TABLE}.acc_month,'2024-08-01')+1
              when ${TABLE}.uw_year = '10' then months_between(${TABLE}.acc_month,'2025-08-01')+1
              else null end   ;;
    label: "UW Year Dev"
  }

  dimension: cat_period {
    type: string
    sql: case when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2016-08-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2017-10-01')))
                    then 'Cat Period 1 (Aug16 - Sep17)'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2017-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2018-10-01')))
                    then 'Cat Period 2 (Oct17 - Sep18)'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2018-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2019-10-01')))
                    then 'Cat Period 3 (Oct18 - Sep19)'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2019-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2020-10-01')))
                    then 'Cat Period 4 (Oct19 - Sep20)'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2020-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2021-10-01')))
                    then 'Cat Period 5 (Oct20 - Sep21)'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2021-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) < (TIMESTAMP '2022-10-01')))
                    then 'Cat Period 6 (Oct21 - Sep22)'
              else null end   ;;
    label: "Cat Period"
  }

  measure: buildings_exposure_aauicl {
    label: "Exposure - BDS"
    type: sum
    sql:  ${TABLE}.buildings_exposure_aauicl ;;
    value_format_name: decimal_0
    group_label: "Exposure"
  }

  measure: contents_exposure_aauicl {
    label: "Exposure - CTS"
    type: sum
    sql:  ${TABLE}.contents_exposure_aauicl ;;
    value_format_name: decimal_0
    group_label: "Exposure"
  }

  measure: combined_exposure_aauicl {
    label: "Exposure - Combined"
    type: sum
    sql:  ${TABLE}.combined_exposure_aauicl ;;
    value_format_name: decimal_0
    group_label: "Exposure"
  }

  measure: personal_exposure {
    label: "Exposure - PPS"
    type: sum
    sql:  ${TABLE}.personal_exposure ;;
    value_format_name: decimal_0
    group_label: "Exposure"
  }

  measure: buildings_exposure_ad {
    label: "Exposure - BDS AD"
    type: sum
    sql:  ${TABLE}.buildings_exposure_ad ;;
    value_format_name: decimal_0
    group_label: "Exposure"
  }

  measure: contents_exposure_ad {
    label: "Exposure - CTS AD"
    type: sum
    sql:  ${TABLE}.contents_exposure_ad ;;
    value_format_name: decimal_0
    group_label: "Exposure"
  }

  measure: earned_premium {
    label: "Earned Premium"
    type: sum
    sql:  ${TABLE}.earned_premium ;;
    value_format_name: decimal_0
    group_label: "Earned Premium"
  }

  measure: buildings_earned_premium {
    label: "Earned Premium - BDS"
    type: sum
    sql:  ${TABLE}.buildings_earned_premium ;;
    value_format_name: decimal_0
    group_label: "Earned Premium"
  }

  measure: contents_earned_premium {
    label: "Earned Premium - CTS"
    type: sum
    sql:  ${TABLE}.contents_earned_premium ;;
    value_format_name: decimal_0
    group_label: "Earned Premium"
  }

  measure: earned_rfq_inf {
    label: "Earned RFQ INF"
    type: sum
    sql:  ${TABLE}.earned_rfq_inf ;;
    value_format_name: decimal_0
    group_label: "Earned RFQ"
  }

  measure: buildings_earned_rfq_inf {
    label: "Earned RFQ INF BDS"
    type: sum
    sql:  ${TABLE}.buildings_earned_rfq_inf ;;
    value_format_name: decimal_0
    group_label: "Earned RFQ"
  }

  measure: contents_earned_rfq_inf {
    label: "Earned RFQ INF CTS"
    type: sum
    sql:  ${TABLE}.contents_earned_rfq_inf ;;
    value_format_name: decimal_0
    group_label: "Earned RFQ"
  }

  measure: earned_rpm_inf {
    label: "Earned RPM INF"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: buildings_earned_rpm_inf {
    label: "Earned RPM INF BDS"
    type: sum
    sql:  ${TABLE}.buildings_earned_rpm_inf ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: contents_earned_rpm_inf {
    label: "Earned RPM INF CTS"
    type: sum
    sql:  ${TABLE}.contents_earned_rpm_inf ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rfq_wlc {
    label: "Earned RFQ WLC"
    type: sum
    sql:  ${TABLE}.earned_rfq_wlc ;;
    value_format_name: decimal_0
    group_label: "Earned RFQ"
  }

  measure: buildings_earned_rfq_wlc {
    label: "Earned RFQ WLC BDS"
    type: sum
    sql:  ${TABLE}.buildings_earned_rfq_wlc ;;
    value_format_name: decimal_0
    group_label: "Earned RFQ"
  }

  measure: contents_earned_rfq_wlc {
    label: "Earned RFQ WLC CTS"
    type: sum
    sql:  ${TABLE}.contents_earned_rfq_wlc ;;
    value_format_name: decimal_0
    group_label: "Earned RFQ"
  }

  measure: earned_rpm_wlc {
    label: "Earned RPM WLC"
    type: sum
    sql:  ${TABLE}.earned_rpm_wlc ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: buildings_earned_rpm_wlc {
    label: "Earned RPM WLC BDS"
    type: sum
    sql:  ${TABLE}.buildings_earned_rpm_wlc ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: contents_earned_rpm_wlc {
    label: "Earned RPM WLC CTS"
    type: sum
    sql:  ${TABLE}.contents_earned_rpm_wlc ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }


  measure: earned_rpm_inf_bds_ad {
    label: "Earned RPM INF BDS AD"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_bds_ad ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_bds_eow {
    label: "Earned RPM INF BDS EoW"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_bds_eow ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_bds_fire {
    label: "Earned RPM INF BDS Fire"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_bds_fire ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_bds_flood {
    label: "Earned RPM INF BDS Flood"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_bds_flood ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_bds_other {
    label: "Earned RPM INF BDS Other"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_bds_other ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_bds_storm {
    label: "Earned RPM INF BDS Storm"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_bds_storm ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_bds_subsidence {
    label: "Earned RPM INF BDS Subsidence"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_bds_subsidence ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_bds_theft {
    label: "Earned RPM INF BDS Theft"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_bds_theft ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_cts_ad {
    label: "Earned RPM INF CTS AD"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_cts_ad ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_cts_eow {
    label: "Earned RPM INF CTS EoW"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_cts_eow ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_cts_fire {
    label: "Earned RPM INF CTS Fire"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_cts_fire ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_cts_flood {
    label: "Earned RPM INF CTS Flood"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_cts_flood ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_cts_other {
    label: "Earned RPM INF CTS Other"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_cts_other ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_cts_storm {
    label: "Earned RPM INF CTS Storm"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_cts_storm ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_cts_theft {
    label: "Earned RPM INF CTS Theft"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_cts_theft ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

  measure: earned_rpm_inf_pps_combined {
    label: "Earned RPM INF PPS Combined"
    type: sum
    sql:  ${TABLE}.earned_rpm_inf_pps_combined ;;
    value_format_name: decimal_0
    group_label: "Earned RPM"
  }

}
