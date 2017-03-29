require_relative '../config/environment'

class Labs < ActiveRecord::Migration

  def change
    CREATE_TABLE :labs do |t|
        t.string :name
       t.integer :student_id
     end
   end
end
