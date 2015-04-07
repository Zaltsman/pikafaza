class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.references :game, index: true
      t.integer :player_number
      t.integer :guess

      t.timestamps null: false
    end
    add_foreign_key :turns, :games
  end
end
