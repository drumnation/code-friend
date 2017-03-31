class CreateInvitedStudentsTable < ActiveRecord::Migration

  def change
     create_table :invited_students do |t|
        t.integer :organizer_id
        t.integer :student_id
     end
   end

end
