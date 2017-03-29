
class ChangeClassToCohortStudentsTable < ActiveRecord::Migration

  def change
    rename_column :students, :class, :cohort  
  end

end
