view: lk_h_reserving_vectors {
  sql_table_name: actian.lk_h_reserving_vectors ;;

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

  dimension: uw_year_acc_month {
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

  dimension: fuw_year_acc_month {
    type: number
    sql: case when (((cast(lk_h_reserving_vectors.acc_month as timestamp) ) >= ((TIMESTAMP '2016-02-01')) AND (cast(lk_h_reserving_vectors.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2016-02-01' ))))) then months_between(${TABLE}.acc_month,'2016-02-01')+1
              when (((cast(lk_h_reserving_vectors.acc_month as timestamp) ) >= ((TIMESTAMP '2017-02-01')) AND (cast(lk_h_reserving_vectors.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2017-02-01' ))))) then months_between(${TABLE}.acc_month,'2017-02-01')+1
              when (((cast(lk_h_reserving_vectors.acc_month as timestamp) ) >= ((TIMESTAMP '2018-02-01')) AND (cast(lk_h_reserving_vectors.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2018-02-01' ))))) then months_between(${TABLE}.acc_month,'2018-02-01')+1
              when (((cast(lk_h_reserving_vectors.acc_month as timestamp) ) >= ((TIMESTAMP '2019-02-01')) AND (cast(lk_h_reserving_vectors.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2019-02-01' ))))) then months_between(${TABLE}.acc_month,'2019-02-01')+1
              when (((cast(lk_h_reserving_vectors.acc_month as timestamp) ) >= ((TIMESTAMP '2020-02-01')) AND (cast(lk_h_reserving_vectors.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2020-02-01' ))))) then months_between(${TABLE}.acc_month,'2020-02-01')+1
              when (((cast(lk_h_reserving_vectors.acc_month as timestamp) ) >= ((TIMESTAMP '2021-02-01')) AND (cast(lk_h_reserving_vectors.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2021-02-01' ))))) then months_between(${TABLE}.acc_month,'2021-02-01')+1
              when (((cast(lk_h_reserving_vectors.acc_month as timestamp) ) >= ((TIMESTAMP '2022-02-01')) AND (cast(lk_h_reserving_vectors.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2022-02-01' ))))) then months_between(${TABLE}.acc_month,'2022-02-01')+1
              when (((cast(lk_h_reserving_vectors.acc_month as timestamp) ) >= ((TIMESTAMP '2023-02-01')) AND (cast(lk_h_reserving_vectors.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2023-02-01' ))))) then months_between(${TABLE}.acc_month,'2023-02-01')+1
              when (((cast(lk_h_reserving_vectors.acc_month as timestamp) ) >= ((TIMESTAMP '2024-02-01')) AND (cast(lk_h_reserving_vectors.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2024-02-01' ))))) then months_between(${TABLE}.acc_month,'2024-02-01')+1
              when (((cast(lk_h_reserving_vectors.acc_month as timestamp) ) >= ((TIMESTAMP '2025-02-01')) AND (cast(lk_h_reserving_vectors.acc_month as timestamp) ) < ((TIMESTAMPADD(year,1, TIMESTAMP '2025-02-01' ))))) then months_between(${TABLE}.acc_month,'2025-02-01')+1
              else null end   ;;
    label: "Accident Year Dev"
  }

  dimension: cat_period {
    type: string
    sql: case when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2016-08-01') AND (cast(${TABLE}.acc_month as timestamp) ) <= (TIMESTAMP '2017-10-01')))
                    then 'Aug16 - Sep17'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2017-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) <= (TIMESTAMP '2018-10-01')))
                    then 'Oct17 - Sep18'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2018-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) <= (TIMESTAMP '2019-10-01')))
                    then 'Oct18 - Sep19'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2019-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) <= (TIMESTAMP '2020-10-01')))
                    then 'Oct19 - Sep20'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2020-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) <= (TIMESTAMP '2021-10-01')))
                    then 'Oct20 - Sep21'
              when (((cast(${TABLE}.acc_month as timestamp) ) >= (TIMESTAMP '2021-10-01') AND (cast(${TABLE}.acc_month as timestamp) ) <= (TIMESTAMP '2022-10-01')))
                    then 'Oct21 - Sep22'
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

  ### Fields for COR

  ## NEEDS UPDATING FOR 2021 ###
  measure: flood_re_levy {
    label: "Flood Re Levy"
    type: sum
    sql: case when ${TABLE}.uw_year = '1' then 0.0555*${TABLE}.earned_premium
              when ${TABLE}.uw_year = '2' then 0.0567*${TABLE}.earned_premium
              when ${TABLE}.uw_year = '3' then 0.0546*${TABLE}.earned_premium
              when ${TABLE}.uw_year = '4' then 0.0528*${TABLE}.earned_premium
              when ${TABLE}.uw_year = '5' then 0.0545*${TABLE}.earned_premium
              else 0 end ;;
    value_format_name: decimal_0
    group_label: "COR Measures"
  }

  measure: flood_re_ratio {
    label: "Flood Re Ratio"
    type: number
    sql: 1.0*${flood_re_levy}/nullif(${earned_premium},0) ;;
    value_format_name: percent_1
    group_label: "COR Measures"
  }

  ## NEEDS UPDATING FOR CAT 2020 RENEWAL ###
  measure: cat_cost {
    label: "Cat Cover Cost"
    type: sum
    sql: case when ${cat_period} = 'Aug16 - Sep17' then ${TABLE}.earned_premium*0.0800
              when ${cat_period} = 'Oct17 - Sep18' then ${TABLE}.earned_premium*0.0995
              when ${cat_period} = 'Oct18 - Sep19' then ${TABLE}.earned_premium*0.0917
              when ${cat_period} = 'Oct19 - Sep20' then ${TABLE}.earned_premium*0.0917
              when ${cat_period} = 'Oct20 - Sep21' then ${TABLE}.earned_premium*0.0951
              else 0 end ;;
    value_format_name: decimal_0
    group_label: "COR Measures"
  }

  measure: cat_cost_ratio {
    label: "Cat Cost Ratio"
    type: number
    sql: 1.0*${cat_cost}/nullif(${earned_premium},0) ;;
    value_format_name: percent_1
    group_label: "COR Measures"
  }


  ## NEEDS UPDATING FOR UWY5 ABE ###
  measure: abe_projected_incurred{
    label: "ABE Projected Incurred"
    type: sum
    sql: case when ${TABLE}.uw_year = '1' then 0.603*${TABLE}.earned_premium
              when ${TABLE}.uw_year = '2' then 0.552*${TABLE}.earned_premium
              when ${TABLE}.uw_year = '3' then 0.501*${TABLE}.earned_premium
              when ${TABLE}.uw_year = '4' then 0.452*${TABLE}.earned_premium
              else 0 end ;;
    value_format_name: decimal_0
    group_label: "COR Measures"
  }

  measure: abe_by_uw_year{
    label: "ABE by UW Year"
    type: number
    sql: 1.0*${abe_projected_incurred}/nullif(${earned_premium},0) ;;
    value_format_name: percent_1
    group_label: "COR Measures"
  }

  measure: fixed_commission_costs {
    label: "Fixed Commission (£)"
    type: sum
    sql: case when ${TABLE}.uw_year in(1,2,3) then 0.16*${TABLE}.earned_premium else 0.08*${TABLE}.earned_premium end ;;
    value_format_name: decimal_0
    group_label: "COR Measures"
  }

  measure: fixed_commission {
    label: "Fixed Commission"
    type: number
    sql: ${fixed_commission_costs}/nullif(${earned_premium},0) ;;
    value_format_name: percent_1
    group_label: "COR Measures"
  }


}
