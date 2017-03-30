
class RemoveLabDisplayAndGithubColumnsFromLab < ActiveRecord::Migration

  def change
    remove_column :labs, :lab_name_github
    remove_column :labs, :lab_name_display
  end

end
