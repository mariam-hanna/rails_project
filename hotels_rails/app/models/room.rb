class Room < ActiveRecord::Base
	belongs_to :hotel
	validates :room_price ,confirmation:true,:presence => true
	validates :img ,confirmation:true,:presence => true
	validates :hotel_id ,confirmation:true,:presence => true
end
