# tic.blogdown

[![Travis-CI Build Status](https://travis-ci.org/ropenscilabs/tic.blogdown.svg?branch=master)](https://travis-ci.org/ropenscilabs/tic.blogdown)
[![Build status](https://ci.appveyor.com/api/projects/status/eyq1syaite6adkbe?svg=true)](https://ci.appveyor.com/project/ropenscilabs/tic-blogdown)
[![Coverage Status](https://codecov.io/gh/ropenscilabs/tic.blogdown/branch/master/graph/badge.svg)](https://codecov.io/github/ropenscilabs/tic.blogdown?branch=master)

A minimal example [blogdown](https://bookdown.org/yihui/blogdown/) created and uploaded by {tic}, and hosted by Netlify.
{tic} is an R package for CI-agnostic workflow definitions for various R projects.

To deploy the site, we recommend to use [Netlify](https://bookdown.org/yihui/blogdown/netlify.html).
The CI approach presented here ensures that the site is build properly but does not do any hosting.

See its [documentation](https://docs.ropensci/tic) for more information.

## Differences to a conventional CI setup

Only a few files need to be added or changed to enable integration with {tic}:

- [`tic.R`](tic.R): This file describes the CI workflow.
- [`.travis.yml`](.travis.yml): This file translates between CI stages of Travis CI and {tic} stages.
- [`appveyor.yml`](appveyor.yml): This file translates between CI stages of AppVeyor and {tic} stages.
- [`.Rbuildignore`](.Rbuildignore): The listed files should not be part of the R package building process and must be excluded.

## Set up an operational fork of this repository

If you want to experiment with _travis_ and {tic} for a _blogdown_ project, you can fork it.

1. Use `usethis::create_from_github()` to automatically create a fork of this repo.
    If you use RStudio, a new RStudio project will open. 
    You may need to set up your SSH credentials first. 
    See [this guide](http://happygitwithr.com/ssh-keys.html) if you're having problems. 
    (It's definitely worth getting this function running as it saves you a lot of time in the future!) 
    Alternatively, fork this repo on Github and then create a new R Project within RStudio (File -> New Project -> Version Control -> Github). 
1. Run `tic::use_tic()` to set up all requirements needed for the CI integration of your package.
