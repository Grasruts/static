# capistrano scm static

It is a plugin for capistrano scm to deploy static sites. Support compression of dist. and uncompress to reduce deploy time.

# Installation

## Gemfile.rb

`gem 'capistrano-scm-static', '~> 0.0.2', require: false`

## Capfile

```
require 'capistrano/scm/static'
install_plugin Capistrano::SCM::Static
```

## deploy.rb

`set :dist, 'path to your static template compilation folder'`

For eg,

set :dist, 'build' # in case for reactjs


set :dist, 'dist' # in case for vuejs
