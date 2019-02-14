begin
  require 'capistrano/scm/plugin'
rescue LoadError
  module Capistrano
    class Plugin; end
    class SCM
      class Plugin < ::Capistrano::Plugin
      end
    end
  end
end

module Capistrano
  class SCM
    class Static < ::Capistrano::SCM::Plugin
      VERSION = "0.0.2"
     end
  end
end
