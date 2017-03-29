
class RemoveSolutionIdFromLabsTable < ActiveRecord::Migration

  def change
    remove_column :labs, :solution_id
  end

end
