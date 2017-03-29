
class CreateStudentsTable < ActiveRecord::Migration

  def change
    create_table :students do |t|
        t.string :name
       t.integer :class
        t.string :github_username
        t.string :slack_username
        t.string :cell
        t.string :email
      end
    end

end
