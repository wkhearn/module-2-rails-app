class CreateExperienceSignups < ActiveRecord::Migration[5.1]
  def change
    create_table :experience_signups do |t|
      t.references :user
      t.references :experience

      t.timestamps
    end
  end
end
