require 'capistrano/scm/plugin'
require "capistrano/scm/static/version"

module Capistrano
   class SCM
     class Static < ::Capistrano::SCM::Plugin
       def set_defaults
       end

       # Define create_release task to zip, upload, uncompress and cleanup for distribution
       def define_tasks
         this_plugin = self
         namespace :static do
           task :create_release do
             this_plugin.compress_build
             on release_roles :all do
               execute :mkdir, "-p", release_path
               upload! "#{fetch(:dist)}.tar.gz", release_path
               execute :tar, 'xvf',  "#{release_path}/#{fetch(:dist)}.tar.gz", '-C', release_path, '--strip-components=1'
               execute :rm, '-rf', "#{fetch(:dist)}.tar.gz"
             end
           end
         end
       end

      def register_hooks
        after "deploy:new_release_path", "static:create_release"
      end

      def compress_build
        system("tar zvcf #{fetch(:dist)}.tar.gz #{fetch(:dist)}/")
      end
    end
  end
end

