class Hotel < ActiveRecord::Base
	has_many :rooms
	validates :name ,confirmation:true,:presence => true
	validates :city ,confirmation:true,:presence => true
	validates :region ,confirmation:true,:presence => true
	validates :address ,confirmation:true,:presence => true
end
