require '../config/environment'

class Notifier
  def self.send_sms_notifications
    new.send_sms_notifications
  end

  def initialize
    account_sid = ENV['AC5256da1b5a3c4b95f0c45da64c057a02']
    auth_token  = ENV['cf4336cc779ad44670ef0023bda047cf']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_sms_notifications
    alert_message = '#{Name} is looking for partners on #{lab_name_display}.'
    students = YAML.load_file('config/number_list.yml')
    students.each do |admin|
      phone_number = admin['phone_number']
      send_sms(phone_number, alert_message, image_url)
    end
  end

  private

  def send_sms(phone_number, alert_message, image_url)
    @client.messages.create(
      from:      ENV['TWILIO_NUMBER'],
      to:        phone_number,
      body:      alert_message,
      media_url: image_url
    )
  end
end
