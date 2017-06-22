class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.references :restaurant
      t.datetime :date

      t.timestamps
    end
  end
end
