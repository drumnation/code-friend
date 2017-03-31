class CreateEventsTable < ActiveRecord::Migration

  def change
     create_table :events do |t|
         t.string :lab_id
         t.string :organizer_id
         t.string :invited_students_id
         t.string :location
       t.datetime :time
     end
   end

end
