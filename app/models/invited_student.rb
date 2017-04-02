require_relative '../../config/environment'

class InvitedStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :lab
end
