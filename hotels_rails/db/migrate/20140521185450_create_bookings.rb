class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :hotel_id
      t.integer :room_id
      t.date :chkin
      t.date :chkout

      t.timestamps
    end
  end
end
