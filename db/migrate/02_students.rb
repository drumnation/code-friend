require_relative '../config/environment'

class Students < ActiveRecord::Migration

  def change
    CREATE_TABLE :students do |t|
        t.string :name
        t.string :github_username
        t.string :class
      end
    end
    
end
