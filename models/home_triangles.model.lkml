connection: "echo_actian"

# include all the views
include: "/views/**/*.view"
fiscal_month_offset: -11

datagroup: home_triangles_default_datagroup {
  sql_trigger: SELECT MAX(load_dttm) FROM actian.lk_h_reserving_triangles;;
  max_cache_age: "240 hours"
}

persist_with: home_triangles_default_datagroup


explore: lk_h_reserving_triangles {
  label: "Reserving Triangles"
}
explore: lk_h_reserving_vectors {
  label: "Reserving Vectors"
}
