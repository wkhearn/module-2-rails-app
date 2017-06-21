class AddCohortToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :cohort, index: true
  end
end
