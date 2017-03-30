require_relative '../config/environment'
require '/Users/davidmieloch/dev/learn-live-love/secret.rb'
require 'rubygems'
require 'twilio-ruby'


  def greeting
    puts `clear`
    <<-HEREDOC

    ….*☆.¸.☆*’
    ….*☆.@@ ☆*’
    .*☆.@@@@☆*’
    ….@@@@@@
    …☆*@@@@`*☆.¸¸
    …….\||///.
    ……..\||//.
    ………ƸӜƷ.
    ……….|/..♥
    ………..V….WELCOME TO CODE FRIEND!!!!

    HEREDOC
  end

  def main_menu
    puts "Press 1 to Find a Lab Partner"
    main_menu_input = gets.strip.to_i
      if main_menu_input != integer
        puts "Please enter a number"
      end
    # puts "Press 2 to Generate a Huge List of Answers by Class"
  end

  def whats_your_name
    flatiron_student = gets.strip.to_s.downcase
  end

  def who_are_you # we know your student object
   puts "Please enter your full name so we can find you in our database."
   whats_your_name
   puts "Code-Friend Welcomes you #{whats_your_name.split[0]}!"
 end

   def invalid_input
     puts "We didn't find you in the database. Make sure you are putting your full first and last name"
   end


   def optional_cell # if we have cell skip this question
     puts "Enter your cell phone number for potential lab pairing."
     puts "Please press 1 if yes, press 2 if you already."
   end


   def main_menu
     puts "Press 1 to Find a Lab Partner"
     # puts "Press 2 to Generate a Huge List of Answers by Class"
   end

  def students_that_need_partners(lab)
    puts lab.who_needs_a_partner # returns github username array of who needs partner
  end

  def which_lab? # returns lab instance/object
    puts "> Which lab do you need a partner for?"
    puts "Please copy paste the lab name from github."
    puts "ex. ruby-class-variables-and-class-methods-readme-web-031317"
    lab_name = gets.strip.downcase
    Lab.find_by(pull_url: "https://api.github.com/repos/learn-co-students/#{lab_name}/pulls")
    # need to match downcase to db
  end

  # students_that_need_partners(which_lab?)

  def send_text(lab)

    account_sid = T_SID
    auth_token = T_AT
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+14846850791" # Your Twilio number

    lab.final_sms_hash.each do |key, value|
      # binding.pry
      if key.length == 12
        client.account.messages.create(
          :from => from,
          :to => key,
          :body => "Hey #{value}, Let's work on #{lab.get_lab_display_from_pull}!"
        )
        puts "Sent message to #{value}"
      end
    end
  end

  send_text(which_lab?)


# activerecord-tvland-web-031317










  def runner
    greeting


    sleep(1)
    welcome
  end
# end
