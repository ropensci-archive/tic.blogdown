get_stage("before_install") %>%
  add_code_step(update.packages(ask = FALSE))

get_stage("install") %>%
  add_step(step_install_cran("blogdown")) %>%
  add_code_step(blogdown::install_hugo())

get_stage("script") %>%
  add_code_step(blogdown::build_site())
