require 'rubygems'
require 'twilio-ruby'

account_sid = "AC5256da1b5a3c4b95f0c45da64c057a02"
auth_token = "cf4336cc779ad44670ef0023bda047cf"
client = Twilio::REST::Client.new account_sid, auth_token

from = "+14846850791" # Your Twilio number

friends = {
"+18473222345" => "Peter",
"+16107164984" => "Dave",
"+18043871460" => "Scott",
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  )
  puts "Sent message to #{value}"
end
