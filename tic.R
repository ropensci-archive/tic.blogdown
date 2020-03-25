get_stage("install") %>%
  add_step(step_install_deps()) %>%
  add_step(step_install_cran("blogdown")) %>%
  add_code_step(blogdown::install_hugo())

get_stage("script") %>%
  add_code_step(blogdown::build_site())

if (ci_on_travis() && ci_has_env("BUILD_BLOGDOWN")) {
  get_stage("before_deploy") %>%
    add_step(step_setup_ssh())

  if (ci_get_branch() == "master") {
    get_stage("deploy") %>%
      add_step(step_setup_push_deploy(path = "docs", branch = "gh-pages",
        orphan = TRUE)) %>%
      add_step(step_do_push_deploy(path = "docs"))
  }
}