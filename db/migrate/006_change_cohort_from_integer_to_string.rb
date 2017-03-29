
class ChangeCohortFromIntegerToString < ActiveRecord::Migration

  def change
    change_column :students, :cohort, :string
  end

end
