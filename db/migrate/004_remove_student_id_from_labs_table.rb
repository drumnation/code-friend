
class RemoveStudentIdFromLabsTable < ActiveRecord::Migration

  def change
    remove_column :labs, :student_id
  end

end
