require_relative '../config/environment'

class Solutions < ActiveRecord::Migration

  def change
    CREATE_TABLE :solutions do |t|
        t.string :solution
       t.integer :lab_id
       t.integer :student_id
    end
  end
  
end
