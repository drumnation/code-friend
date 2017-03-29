require 'bundler/setup'
Bundler.require
require 'oauth'
access_token = "b539db35af0233dbbe5f66a438cf4f349018b2b4"

RestClient::Request.execute method: :get, url: "https://github.com/drumnation", username: 'drumnation', token: access_token

# require_all 'lib'
# require_all 'app'
# require_all 'bin'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/code_friend.db'
)
