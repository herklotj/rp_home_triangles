connection: "echo_actian"

# include all the views
include: "/views/**/*.view"
fiscal_month_offset: -11

datagroup: home_triangles_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: home_triangles_default_datagroup


explore: lk_h_reserving_triangles {
  label: "Reserving Triangles"
}
explore: lk_h_reserving_vectors {
  label: "Reserving Vectors"
}
