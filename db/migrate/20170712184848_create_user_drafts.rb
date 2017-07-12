class CreateUserDrafts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_drafts do |t|
    	t.belongs_to :user
    	t.integer :position, null: false
      t.timestamps
    end
  end
end
