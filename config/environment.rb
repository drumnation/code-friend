require 'bundler/setup'
Bundler.require

# require_all 'app'
# require_all 'bin'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/code_friend.db'
)

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

# configure :development do
#   set :database, 'sqlite3:db/database.db'
# end
