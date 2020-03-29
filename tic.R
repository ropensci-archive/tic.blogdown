if (ci_on_travis() && ci_has_env("BUILD_BLOGDOWN")) {
  do_blogdown(orphan = TRUE)
}
