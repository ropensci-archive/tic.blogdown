get_stage("install") %>%
  add_step(step_install_deps()) %>%
  add_step(step_install_cran("blogdown")) %>%
  add_code_step(blogdown::install_hugo())

get_stage("script") %>%
  add_code_step(blogdown::build_site())
