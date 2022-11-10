class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.string :name
      t.text :resume
      t.text :procedure
      t.text :evaluation
      t.integer :score
      t.integer :minutes
      t.integer :level
      t.integer :feedback

      t.timestamps
    end
  end
end
