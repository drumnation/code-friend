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
        when "Q"
          return
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
   students_menu
   organizer_self_selection
  #  puts "Thank you.  Please enter your phone number."
  #  number = gets.chomp
  #  get_cell_phone_number(find_person_in_db, number)
   puts `clear`
   puts "Code-Friend Welcomes you #{@name_input.split[0]}!"
   puts ""
  end

  def students_menu
    puts <<~HEREDOC

    TYPE YOUR NUMBER TO LOGIN

    1. Sylvia Lee
    2. Meryl Dakin
    3. Peter Chicarielli
    4. Elizabeth Nicholson
    5. Anna Olshevskaia
    6. Robert Weber
    7. Sarah Bruce
    8. Duncan Maina
    9. Sammy Steiner
    10. Curtis Greene
    11. Naz Khan
    12. Ethan Ryan
    13. Christopher Hague
    14. Scott Harrison
    15. Daniel Park
    16. Charlie Stopek
    17. Peter Kim
    18. Usman Pervaiz
    19. David Mieloch
    20. Runnan Tina Zhong
    21. Mark deGroat

    HEREDOC
  end

  def organizer_self_selection
    case gets.strip
    when "1"
      @name_input = 'Sylvia Lee'
    when "2"
      @name_input = 'Meryl Dakin'
    when "3"
      @name_input = 'Peter Chicarielli'
    when "4"
      @name_input = 'Elizabeth Nicholson'
    when "5"
      @name_input = 'Anna Olshevskaia'
    when "6"
      @name_input = 'Robert Weber'
    when "7"
      @name_input = 'Sarah Bruce'
    when "8"
      @name_input = 'Duncan Maina'
    when "9"
      @name_input = 'Sammy Steiner'
    when "10"
      @name_input = 'Curtis Greene'
    when "11"
      @name_input = 'Naz Khan'
    when "12"
      @name_input = 'Ethan Ryan'
    when "13"
      @name_input = 'Christopher Hague'
    when "14"
      @name_input = 'Scott Harrison'
    when "15"
      @name_input = 'Daniel Park'
    when "16"
      @name_input = 'Charlie Stopek'
    when "17"
      @name_input = 'Peter Kim'
    when "18"
      @name_input = 'Usman Pervaiz'
    when "19"
      @name_input = 'David Mieloch'
    when "20"
      @name_input = 'Runnan Tina Zhong'
    when "21"
      @name_input = 'Mark deGroat'
    else
      puts "INVALID INPUT."
      sleep(1)
      puts `clear`
      puts "Come on can't you type?"
      puts (1)
      students_menu
    end
  end

# def invalid_input
#  puts "We didn't find you in the database. Make sure you are putting your full first and last name"
# end
# 
# def optional_cell # if we have cell skip this question
#  puts "Enter your cell phone number for potential lab pairing."
#  puts "Please press 1 if yes, press 2 if you already."
# end

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
      location_menu
      time_menu
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

  def location_menu # ask for the location
    puts `clear`
    location_options = <<~HEREDOC

    "Where would you like the group to meet?"

    1. At my desk
    2. By the lunch tables
    3. Turing
    4. Kay
    5. Other

    PRESS Q to Quit

    HEREDOC

    puts location_options

    case gets.strip.upcase
    when "1"
      @location = 'At my desk'
    when "2"
      @location = 'By the lunch tables'
    when "3"
      @location = 'Turing'
    when "4"
      @location = 'Kay'
    when "5"
      @location = gets.strip.downcase.captialize
    when "Q"
      return
    else
      puts "INVALID INPUT!"
      sleep(1)
      puts ""
      puts "Come on, can't you type?"
      sleep(1)
      puts `clear`
      puts location_options
      gets.strip.upcase
    end
  end

  def time_menu # asks for the time
    @location = ''
    @event_time = ''

    time_options = <<~HEREDOC

    "When would you like the group to meet?"

    1. It's an emergency. Meet ASAP (5 min) - #{5.minutes.from_now.strftime("%I:%M")}

    2. I need a bit. (30 min) #{30.minutes.from_now.strftime("%I:%M")}

    3. Taking my time. (45 min) #{45.minutes.from_now.strftime("%I:%M")}

    4. Plenty of time to finish up. (60 min) #{1.hour.from_now.strftime("%I:%M")}

    PRESS Q to Quit

    HEREDOC

    puts time_options

    case gets.strip.upcase
    when "1"
      @event_time = 5.minutes.from_now.strftime("%I:%M")
    when "2"
      @event_time = 15.minutes.from_now.strftime("%I:%M")
    when "3"
      @event_time = 30.minutes.from_now.strftime("%I:%M")
    when "4"
      @event_time = 60.minutes.from_now.strftime("%I:%M")
    when "Q"
      return
    else
      puts "INVALID INPUT!"
      sleep(1)
      puts ""
      puts "Come on, can't you type?"
      sleep(1)
      puts `clear`
      puts time_options
      gets.strip.upcase
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
      if key.length == 12 && @name_
        client.account.messages.create(
          :from => from,
          :to => key,
          :body => "Hey #{value} it's #{@name_input[0]}, I'm organizing a group to work at #{@event_time}:#{@location} on #{lab.get_lab_display_from_pull}!"
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
