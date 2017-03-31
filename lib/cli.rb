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
    puts "Press P to Find a Lab Partner"
      case gets.chomp.upcase
      when "P"
        puts `clear`
        puts "Press E to see students who you can pair with."
        puts "Press Q to Quit Code-Friend."
        case gets.chomp.upcase
        when "E"
          students_that_need_partners_message(which_lab?)
        else
          puts "Invalid Input."
          sleep(1)
          puts `clear`
          puts "Press E to see students who you can pair with."
          puts "Press Q to Quit Code-Friend."
          gets.chomp.upcase
        end
      when "Q"
        return
      else
        puts "Invalid Input"
        sleep(1)
        puts `clear`
        puts "Press P to Find a Lab Partner. Don't mess it up..."
        gets.chomp.upcase
      end
  end

  def who_are_you # we know your student object
   print "\e[8;40;80t"
   puts "Please enter your full name so we can find you in our database."
   @name_input = gets.strip
   puts ""
  #  puts "Thank you.  Please enter your phone number."
  #  number = gets.chomp
  #  get_cell_phone_number(find_person_in_db, number)
   puts "Code-Friend Welcomes you #{@name_input.split[0]}!"
   puts ""
  end

  # def find_person_in_db(@name_input)
  #   Student.find_by(name: name)
  # end
  #
  #
  # def get_cell_phone_number(find_person_in_db, number)
  #   find_person_in_db.update_attribute :cell, "+1#{number}"
  # end

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
    if lab == nil
      return
    end
    puts ""
    puts "****** #{lab.get_lab_display_from_pull.upcase} ******"
    puts ""
    lab.who_needs_a_partner.each do |person|
        puts "#{person} needs a partner."
    end  # returns github username array of who needs partner
    puts ""
    puts "Press T to text students that you're looking to pair."
    puts "Press Q to Quit"
    case gets.chomp.upcase
    when "T"
      send_text(lab)
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
    lab_object = Lab.find_by(pull_url: "https://api.github.com/repos/learn-co-students/#{lab_name}/pulls")
    if lab_object
      lab_object
    else
      puts ""
      puts "~~~~~> Sorry. We couldn't find anything!!!"
      puts ""
      sleep(2)
      puts "Check that the lab name you copied from the learn repo is correct."
      puts ""
      return
    end
  end

  def send_text(lab)
    puts "~~~~~~> PLEASE WAIT. TEXTING YOUR HOMIES!"
    puts "/"
    sleep(1)
    puts "\\"
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

  def runner
    greeting
    sleep(1)
    who_are_you
    main_menu
  end

runner
