require '/Users/davidmieloch/dev/learn-live-love/config/environment'

class Students < ActiveRecord::Migration

  def change
    CREATE_TABLE :students do |t|
        t.string :name
        t.string :github_username
        t.string :slack_username
       t.integer :class
        t.string :cell
        t.string :email
      end
    end

end
