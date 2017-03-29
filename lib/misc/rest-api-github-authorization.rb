require 'rest-client'
require 'json'
require 'pry'
# require '/Users/davidmieloch/dev/learn-live-love/config/environment'

# data = RestClient::Request.execute(method: :get, url: 'https://api.github.com/user', user: '75aad1cd9a496c8c248796dcfcd1fb4dc039c48b') # works


data = RestClient::Request.execute(method: :get, url: 'https://api.github.com/repos/learn-co-students/advanced-hashes-hashketball-web-031317/pulls', user: '75aad1cd9a496c8c248796dcfcd1fb4dc039c48b')
puts JSON.parse(data)
