class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :hotel_id
      t.integer :room_price
      t.string :img
	t.boolean :reserved, :default => false
			
      #t.timestamps
    end

	execute "ALTER TABLE rooms ADD FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE cascade ON UPDATE cascade"
  end
end
