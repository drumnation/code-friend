require '../config/environment'

class Directories < ActiveRecord::Migration

  def change
    CREATE_TABLE :directories do |t|
        t.string :directory_name
        t.string :directory_url
    end
  end

end
