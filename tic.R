get_stage("before_install") %>%
  add_step(step_run_code(update.packages(ask = FALSE)))

get_stage("install") %>%
  add_step(step_run_code(remotes::install_deps(dependencies = TRUE))) %>%
  add_step(step_run_code(blogdown::install_hugo()))

get_stage("deploy") %>%
  add_step(step_run_code({blogdown::build_site()}))

if (Sys.getenv("id_rsa") != "") {
  # pkgdown documentation can be built optionally. Other example criteria:
  # - `inherits(ci(), "TravisCI")`: Only for Travis CI
  # - `ci()$is_tag()`: Only for tags, not for branches
  # - `Sys.getenv("BUILD_PKGDOWN") != ""`: If the env var "BUILD_PKGDOWN" is set
  # - `Sys.getenv("TRAVIS_EVENT_TYPE") == "cron"`: Only for Travis cron jobs
  get_stage("before_deploy") %>%
    add_step(step_install_ssh_keys()) %>%
    add_step(step_add_to_known_hosts("github.com")) %>%
    add_step(step_test_ssh())

  get_stage("deploy") %>%
    add_step(step_push_deploy(path = "public", branch = "gh-pages"))
}
