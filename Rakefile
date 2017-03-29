require_relative '../learn-live-love/config/environment'
require 'sinatra/activerecord/rake'

namespace :dev_tools do
  desc 'Enter a console'
  task :console do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    Pry.start
  end
end
