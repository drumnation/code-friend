require '/Users/davidmieloch/dev/learn-live-love/config/environment'
class Lab < ActiveRecord::Base

  has_many :students

  def get_lab_from_pull
    # self.all.each do |url|
      self.pull_url.split("https://api.github.com/repos/learn-co-curriculum/")[1].split("/pull")[0]
    # end
  end

  def get_students_who_pulled
    hash = RestClient::Request.execute(method: :get, url: self.pull_url, user: '6a717046d7973135a3fc12fea342fb05e31d8d6a')
    lab_hash = JSON.parse(hash)
    lab_hash.map {|hash| hash["user"]["login"] }
  end

  def get_lab_display_from_pull
    get_lab_from_pull.gsub("_", "-").split("-").join(" ")
  end

  def combined_pull_all_list
    Student.get_all_github_usernames + self.get_students_who_pulled
  end

  def who_needs_a_partner
    duplicates = combined_pull_all_list.select do |name|
      combined_pull_all_list.count(name) == 2
    end
    combined_pull_all_list - duplicates
  end

  def get_real_name_from_github
    self.who_needs_a_partner.map do |username|

    end
  end

  # def shithappens
  #   get_students_who_pulled # github usernames of who pulled
  #   who_needs_a_partner # returns github username array of who needs partner
  #   get_real_name_from_github # convert github usernames to real names
  # end
#-------
  def find(name)
    Students.find_by(github_username: name)
  end

  def username_to_object
    Students.find_by(github_username: self)
  end


  def get_phone_number_and_firstname_from_name
    text_hash = {}
    text_hash[Student.find_by(github_username: self.username).cell] = Student.find_by(github_username: self.username).name.split[0]
    text_hash
  end

  def final_sms_hash
    who_needs_a_partner
    sms_hash = {}
    who_needs_a_partner.map do |username|
      username.get_phone_number_and_firstname_from_name.merge(sms_hash)
    end
    sms_hash
  end

end
