class CreateEventsTable < ActiveRecord::Migration

  def change
     create_table :events do |t|
        t.integer :lab_id
        t.integer :organizer_id
         t.string :location
         t.string :time
     end
   end

end
