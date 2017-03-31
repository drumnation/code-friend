require '/Users/davidmieloch/dev/learn-live-love/config/environment'
class InvitedStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :lab
end
