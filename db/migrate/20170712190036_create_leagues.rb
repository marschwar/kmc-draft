class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
    	t.belongs_to :user, null: false
    	t.string :name, null: false
      t.timestamps
    end
  end
end
