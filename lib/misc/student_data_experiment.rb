require 'pry'
# # not alphabetical
#
# slack = ['curtis__greene',
# 'davemieloch',
# 'de.usman',
# 'dpark',
# 'duncan.maina',
# 'ethanryan',
# 'jj_seymour',
# 'liz',
# 'markdegroat',
# 'meryldakin',
# 'naz',
# 'peterchic',
# 'peteryunkim',
# 'runnan.tina',
# 'sbruce',
# 'scott.harrison',
# 'anna.olsh',
# 'charlie_stopek',
# 'chris_hague',
# 'dseehausen',
# 'duncan',
# 'jessica.lava',
# 'robbie',
# 'sammysteiner',
# 'sylvee']
#
# may@flatironschool.com
# cricky@flatironschool.com

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
  puts student_names
  case gets.strip
  when "1"
  when "2"
  when "3"
  when "4"
  when "5"
  when "6"
  when "7"
  when "8"
  when "9"
  when "10"
  when "11"
  when "12"
  when "13"
  when "14"
  when "15"
  when "16"
  when "17"
  when "18"
  when "19"
  when "20"
  else
    puts "INVALID INPUT."
    sleep(1)
    puts `clear`
    puts "Come on can't you type?"
    puts (1)
    puts student_names
  end















all_031317 = [
{ name: 'Sylvia Lee', cohort: '031317', github_username: 'hellosylvee', slack_username: 'sylvee',  email: 'sylvia.lee@flatironschool.com'},
{ name: 'Meryl Dakin', cohort: '031317', github_username: 'meryldakin', slack_username: 'meryldakin', email: 'meryl.dakin@flatironschool.com'},
{ name: 'Peter Chicarielli', cohort: '031317', github_username: 'peterchic', slack_username: 'peterchic', email: 'peter.chicarielli@flatironschoo.com'},
{ name: 'Elizabeth Nicholson', cohort: '031317', github_username: 'elilyly', slack_username: 'liz',  email: 'elizabeth.nicholson@flatironschool.com'},
{ name: 'Anna Olshevskaia', cohort: '031317', github_username: 'annaolsh', slack_username: 'anna.olsh', email: 'anna.olshevskaia@flatironschool.com'},
{ name: 'Robert Weber', cohort: '031317', github_username: 'rweber87', slack_username: 'robbie',  email: 'robert.weber@flatironschool.com'},
{ name: 'Sarah Bruce', cohort: '031317', github_username: 's-bruce', slack_username: 'sbruce',  email: 'sarah.bruce@flatironschool.com'},
{ name: 'Duncan Maina', cohort: '031317', github_username: 'duncandevs', slack_username: 'duncan', email: 'duncan.maina@flatironschool.com'},
{ name: 'Sammy Steiner', cohort: '031317', github_username: 'SammySteiner', slack_username: 'sammysteiner',  email: 'sammy.steiner@flatironschool.com'},
{ name: 'Curtis Greene', cohort: '031317', github_username: 'curtisgreene', slack_username: 'curtis__greene', email: 'curtis.greene@flatironschool.com'},
{ name: 'Naz Khan', cohort: '031317', github_username: 'mega0319', slack_username: 'naz', email: 'naz.khan@flatironschool.com'},
{ name: 'Ethan Ryan', cohort: '031317', github_username: 'ethanryan', slack_username: 'ethanryan',  email: 'ethan.ryan@flatironschool.com'},
{ name: 'Christopher Hague', cohort: '031317', github_username: 'christopher-hague', slack_username: 'chris_hague',  email: 'christopher.hague@flatironchool.com'},
{ name: 'Scott Harrison', cohort: '031317', github_username: 'szharrison', slack_username: 'scott.harrison',  email: 'scott.harrison@flatironschool.com'},
{ name: 'Daniel Park', cohort: '031317', github_username: 'dpark926', slack_username: 'dpark',  email: 'daniel.park@flatironschool.com'},
{ name: 'Charlie Stopek', cohort: '031317', github_username: 'orion1981', slack_username: 'charlie_stopek',  email: 'charlie.stopek@flatironschool.com'},
{ name: 'Peter Kim', cohort: '031317', github_username: 'peteryunkim', slack_username: 'peteryunkim',  email: 'peter.kim@flatironschool.com'},
{ name: 'Usman Pervaiz', cohort: '031317', github_username: 'DeUsman', slack_username: 'de.usman',  email: 'usman.pervaiz@flatironschool.com'},
{ name: 'David Mieloch', cohort: '031317', github_username: 'drumnation', slack_username: 'davemieloch', email: 'david.mieloch@flatironschool.com'},
{ name: 'Runnan Tina Zhong', cohort: '031317', github_username: 'Runnantina', slack_username: 'runnan.tina', email: 'runnan.zhong@flatironschool.com'},
{ name: 'Mark deGroat',  cohort: '031317', github_username: 'markdegroat', slack_username: 'markdegroat',  email: 'mark.degroat@flatironschool.com'}]

all_031317.each do |array|
  array.each do |key, val|
    binding.pry
    # if key == :name
    #   puts val
    # end
    # if key == :cohort
    #   cohort: "#{val}"
    # end
  end
end


# # sorted alphabetically
# ["anna.olsh", "charlie_stopek", "chris_hague",
# "curtis__greene", "davemieloch", "de.usman", "dpark",
# "dseehausen", "duncan", "duncan.maina", "ethanryan",
# "jessica.lava", "jj_seymour", "liz", "markdegroat",
# "meryldakin", "naz", "peterchic", "peteryunkim", "robbie",
# "runnan.tina", "sammysteiner", "sbruce", "scott.harrison",
# "sylvee"]
#
#
# ["hellosylvee", "elilyly", "duncandevs", "Runnantina",
# "ethanryan", "peterchic", "DeUsman", "drumnation",
# "orion1981", "dpark926", "annaolsh", "mega0319",
# "meryldakin", "curtisgreene", "SammySteiner", "peteryunkim",
# "szrharrison", "christopher-hague", "s-bruce", "ipc103",
# "markdegroat", "rweber87"]
#
#
#
#
# p slack.sort
