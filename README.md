# tic.blogdown

[![Travis-CI Build Status](https://travis-ci.org/ropenscilabs/tic.blogdown.svg?branch=master)](https://travis-ci.org/ropenscilabs/tic.blogdown)
[![Build status](https://ci.appveyor.com/api/projects/status/eyq1syaite6adkbe?svg=true)](https://ci.appveyor.com/project/ropenscilabs/tic-blogdown)
[![Coverage Status](https://codecov.io/gh/ropenscilabs/tic.blogdown/branch/master/graph/badge.svg)](https://codecov.io/github/ropenscilabs/tic.blogdown?branch=master)

A minimal example [blogdown](https://bookdown.org/yihui/blogdown/) created and uploaded by _tic_, and hosted by Netlify.
_tic_ is an R package for CI-agnostic workflow definitions for various R projects. 
See its [documentation](https://ropenscilabs.github.io/tic/) for more information.

## Differences to a conventional CI setup

Only a few files need to be added or changed to enable integration with _tic_:

- [`tic.R`](tic.R): This file describes the CI workflow.
- [`.travis.yml`](.travis.yml): This file translates between CI stages of Travis CI and _tic_ stages.
- [`appveyor.yml`](appveyor.yml): This file translates between CI stages of AppVeyor and _tic_ stages.
- [`.Rbuildignore`](.Rbuildignore): The listed files should not be part of the R package building process and must be excluded.

## Set up an operational fork of this repository

If you want to experiment with _travis_ and _tic_ for a _blogdown_ project, you can fork it.

1. Use `usethis::create_from_github()` to automatically create a fork of this repo.
    If you use RStudio, a new RStudio project will open. 
    You may need to set up your SSH credentials first. 
    See [this guide](http://happygitwithr.com/ssh-keys.html) if you're having problems. 
    (It's definitely worth getting this function running as it saves you a lot of time in the future!) 
    Alternatively, fork this repo on Github and then create a new R Project within RStudio (File -> New Project -> Version Control -> Github). 
1. Run `tic::use_tic()` to set up all requirements needed for the CI integration of your package.
