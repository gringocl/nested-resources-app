class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.integer :population
      t.string :abbreviation

      t.timestamps
    end
  end
end
