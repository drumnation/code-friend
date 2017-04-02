require_relative '../../config/environment'

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

end
