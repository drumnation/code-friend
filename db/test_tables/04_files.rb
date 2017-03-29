require '../config/environment'

class Files < ActiveRecord::Migration

  def change
    CREATE_TABLE :files do |t|
        t.string :file_name
        t.string :file_path
        t.string :directory
    end
  end

end
