require '/Users/davidmieloch/dev/learn-live-love/config/environment'
require '/Users/davidmieloch/dev/learn-live-love/secret.rb'
class Lab < ActiveRecord::Base

  has_many :students

  # name changing methods

  def get_lab_display_from_pull
    a = self.pull_url.split("https://api.github.com/repos/learn-co-students/")[1].split("/pull")[0]
    a.gsub("_", "-").split("-").join(" ")
  end

  # lab info - regarding all the pull requests

  def get_students_who_pulled
    hash = RestClient::Request.execute(method: :get, url: self.pull_url, user: TOKEN)
    lab_hash = JSON.parse(hash)
    lab_hash.map {|hash| hash["user"]["login"] }
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

  # class finder methods

  def find(name)
    Student.find_by(github_username: name)
  end

  def username_to_object
    Student.find_by(github_username: self)
  end



  def get_phone_number_and_firstname_from_name
    text_hash = {}
    text_hash[Student.find_by(github_username: username).cell] = Student.find_by(github_username: self.username).name.split[0]
    text_hash
  end

  def final_sms_hash
    names = who_needs_a_partner

    names.each_with_object({}) do |name, result|
      student = Student.find_by(github_username: name)
      if student
        cell_number = student.cell || student.id.to_s
        result[cell_number] = student.name.split[0]
      end
    end

    # sms_hash = {}
    # who_needs_a_partner.map do |username|
    #   username.get_phone_number_and_firstname_from_name.merge(sms_hash)
    # end
    # sms_hash
  end

end
