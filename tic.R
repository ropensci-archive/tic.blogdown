get_stage("before_install") %>%
  add_code_step(update.packages(ask = FALSE))

get_stage("install") %>%
  add_step(step_install_cran("blogdown")) %>%
  add_code_step(blogdown::install_hugo())

if (Sys.getenv("id_rsa") != "") {
  get_stage("before_deploy") %>%
    add_step(step_setup_ssh()) %>%
    add_step(step_setup_push_deploy(
      path = "public",
      branch = "gh-pages"
    ))

  get_stage("deploy") %>%
    add_code_step(blogdown::build_site()) %>%
    add_step(step_do_push_deploy(path = "public"))
}
