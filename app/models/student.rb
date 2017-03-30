require '/Users/davidmieloch/dev/learn-live-love/config/environment'
class Student < ActiveRecord::Base
  has_many :labs

  def self.find_student(name)
    self.find_by(name: name)
  end

  def get_cell_phone_number(number)
    self.update_attribute :cell, "+1#{number}"
  end

  def self.get_all_github_usernames
    all.map do |stud|
      stud.github_username
    end
  end

  # def self.get_fullname_from_username(username)
  #   Student.find_by(github_username: username).name
  # end

  # def get_first_name_from_fullname(username)
  #   Student.get_name_from_username(username).split[0]
  # end

  # def self.get_phone_number_and_firstname_from_name(username)
  #   text_hash = {}
  #   text_hash[Student.find_by(github_username: username).cell] = Student.find_by(github_username: username).name.split[0]
  #   text_hash
  # end
  #
  # def final_sms_hash(who_needs_a_partner)
  #   sms_hash = {}
  #   who_needs_a_partner.map do |usernames|
  #     get_phone_number_and_firstname_from_name(usernames).merge(sms_hash)
  #   end
  #   sms_hash
  # end

  def populate_hash
    text_hash = {}
    lab.who_needs_a_partner.each do |usernames|
      text_hash[users.cell] = users.name.split[0]
    end
  end


end
