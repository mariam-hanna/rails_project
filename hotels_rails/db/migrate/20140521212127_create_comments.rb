class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
			t.string :user_name
      t.integer :hotel_id
      t.integer :room_id
      t.string :comment

      t.timestamps
    end
  end
end
