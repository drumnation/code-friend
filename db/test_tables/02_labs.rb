require '../config/environment'

class Labs < ActiveRecord::Migration

  def change
    CREATE_TABLE :labs do |t|
        t.string :lab_name_github
        t.string :lab_name_display
        t.integer :student_id
     end
   end
end
