class CreateDraftPicks < ActiveRecord::Migration[5.0]
  def change
    create_table :draft_picks do |t|
      t.belongs_to :league, null: false
    	t.belongs_to :user, null: false
    	t.belongs_to :player, null: true
    	t.integer :position, null: false
      t.boolean :joker
      t.datetime :start_date
      t.datetime :end_date
    	t.integer :duration
      t.timestamps

      t.index [:league_id, :position], unique: true
    end
  end
end
