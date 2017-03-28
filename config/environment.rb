require 'bundler/setup'
require 'rest-client'
Bundler.require

DB = {
  conn: SQLite3::Database.new('db/FOOBAR.sqlite')
}

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/FOOBAR.sqlite'
)

require_all 'lib'
require_all 'app'
require_all 'bin'