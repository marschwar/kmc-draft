class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
    	t.belongs_to :team, null: false
    	t.string :name, null: false
    	t.string :position, null: false 
    	t.integer :games_played
    	t.numeric :score
      t.integer :goals
      t.integer :assists
      t.integer :team_of_the_day
      t.timestamps
    end
  end
end
