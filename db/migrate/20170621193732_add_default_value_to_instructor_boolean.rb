class AddDefaultValueToInstructorBoolean < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :instructor, :boolean, :default => false
  end
end
