
class AddPullUrlColumnToLabs < ActiveRecord::Migration

  def change
    add_column :labs, :pull_url, :string
  end

end
