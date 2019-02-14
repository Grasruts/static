require 'capistrano/scm/plugin'
require "capistrano/scm/static/version"

module Capistrano
   class SCM
     class Static < ::Capistrano::SCM::Plugin
       def set_defaults
       end

       def define_tasks
         this_plugin = self
         namespace :static do
           task :create_release do
             files = this_plugin.load_contents_from_dir
             on release_roles :all do
               execute :mkdir, "-p", release_path
               files.each do |file|
                 upload! "#{fetch(:dist)}/#{file}", release_path, recursive: true
               end
             end
           end
         end
       end

      def register_hooks
        after "deploy:new_release_path", "static:create_release"
      end

      def load_contents_from_dir
        Dir.entries(fetch(:dist)).select {|f| !File.directory? f}
      end
    end
  end
end

