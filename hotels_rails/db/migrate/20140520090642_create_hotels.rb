class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :country
      t.string :city
      t.string :region
      t.string :name
      t.string :address
      t.string :phone
				
      #t.timestamps
    end
  end
end
