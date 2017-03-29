
class CreateLabsTable < ActiveRecord::Migration

  def change
     create_table :labs do |t|
        t.string :lab_name_github
        t.string :lab_name_display
        t.integer :student_id
        t.integer :solution_id
     end
   end

end
