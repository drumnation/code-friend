require_relative '../../config/environment'

class Event < ActiveRecord::Base
  has_many :students

  def self.find_event(lab_name)
    self.find_by(name: name)
  end

end
