class AddInstructorAttributeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :instructor, :boolean
  end
end
