class AddNumbersToGame < ActiveRecord::Migration
  def change
    add_column :games, :player_1_number, :integer
    add_column :games, :player_2_number, :integer
  end
end
