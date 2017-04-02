require 'bundler/setup'
Bundler.require

ActiveRecord::Base.logger = nil

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: '../db/code_friend.db'
)

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}