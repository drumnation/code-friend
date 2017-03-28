require 'bundler/setup'
require 'rest-client'
Bundler.require

DB = {
  conn: SQLite3::Database.new('db/code_friend.sqlite')
}

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/code_friend.sqlite'
)

require_all 'lib'
require_all 'app'
require_all 'bin'