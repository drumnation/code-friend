require_relative '../config/environment'
require '/Users/davidmieloch/dev/learn-live-love/secret.rb'
require 'rubygems'
require 'twilio-ruby'


  def greeting
    puts `clear`
    puts <<~HEREDOC

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
      case gets.chomp
      when "1"
        puts `clear`
        puts "Press 1 to see students who you can pair with."
        puts "Press 9 to Quit Code-Friend."
        case gets.chomp
        when "1"
          students_that_need_partners_message(which_lab?)
          puts ""
          puts "Press T to text students that you're looking to pair."
          puts "Press Q to Quit"
          case gets.chomp.upcase
          when "T"
            send_text(which_lab?)
          when "Q"
            return
          else
            puts `clear`
            puts "Invalid Input."
            sleep(1)
            puts `clear`
            puts "Press T to text students that you're looking to pair."
            puts "Press Q to Quit"
          end
        else
          puts "Invalid Input."
          sleep(1)
          puts `clear`
          puts "Press 1 to see students who you can pair with."
          puts "Press 2 to text students that you're looking to pair."
          puts "Press 9 to Quit Code-Friend."
        end
      when "9"
        return
      else
        puts "Please enter a number"
        sleep(1)
        puts "Press 1 to Find a Lab Partner"
        gets.chomp
      end
    # puts "Press 2 to Generate a Huge List of Answers by Class"
  end

  def who_are_you # we know your student object
   print "\e[8;40;80t"
   puts "Please enter your full name so we can find you in our database."
   @name_input = gets.strip
   puts ""
   puts "Code-Friend Welcomes you #{@name_input.split[0]}!"
   puts ""
  end

   def invalid_input
     puts "We didn't find you in the database. Make sure you are putting your full first and last name"
   end

   def optional_cell # if we have cell skip this question
     puts "Enter your cell phone number for potential lab pairing."
     puts "Please press 1 if yes, press 2 if you already."
   end

  def students_that_need_partners(lab)
    puts lab.who_needs_a_partner # returns github username array of who needs partner
  end

  def students_that_need_partners_message(lab)
    puts ""
    puts "****** #{lab.get_lab_display_from_pull.upcase} ******"
    puts ""
    lab.who_needs_a_partner.each do |person|
        puts "#{person} needs a partner."
    end  # returns github username array of who needs partner
  end

  def which_lab? # returns lab instance/object
    puts "> Which lab do you need a partner for?"
    puts "Please copy paste the lab name from github."
    puts "ex. activerecord-tvland-web-031317"
    lab_name = gets.strip.downcase
    puts ""
    puts "~~~~> Thank you.  Searching the Matrix...."
    puts "/"
    sleep(1)
    puts "\\"
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
          :body => "Hey #{value} it's #{@name_input}, Let's work on #{lab.get_lab_display_from_pull}!"
        )
        puts "Sent message to #{value}"
      end
    end
  end

  # send_text(which_lab?)

# activerecord-tvland-web-031317

  def runner
    greeting
    sleep(1)
    who_are_you
    main_menu
  end
# end

runner
