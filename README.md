# capistrano scm static

It is a plugin for capistrano scm to deploy static sites.


# Installation

Add this to your gem file

`gem 'capistrano-scm-static', '~> 0.0.2', require: false`

## deploy.rb

set :dist, 'path to your static template compilation folder'
