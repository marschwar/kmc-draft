class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :name, null: false
    	t.boolean :admin, null: false, default: false
      t.timestamps

      t.index :name, unique: true
    end
  end
end
