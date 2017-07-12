class CreateLeagueUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :league_users do |t|
    	t.belongs_to :league, null: false
    	t.belongs_to :user, null: false
      t.timestamps
    end
  end
end
