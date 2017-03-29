# require '../config/environment'

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
    puts "Press 2 to Generate a Huge List of Answers by Class"
  end

  def which_lab?
    lab_name = gets.strip
  end

  # def partner_finder(all_class_members)
  #   lab = which_lab?
  #
  #   # use rest to query api about above lab and return an array
  #   # of users names that submitted a pull request for the lab
  #
  #   get_user_names.map do |username| username !=
  #
  #   end
    # compare all_031317 -> above return array of pull requests
    # return array from all_031317 that were not in the pull request


  # end

  def runner
    greeting
    sleep(1)
    welcome
  end
