require 'digest/md5'

class UsersController < ApplicationController
  
	# GET /users
  def index
    @hotels = Hotel.all
    respond_to do |format|
      format.html
		end
  end

	#***************get all rooms in specific hotel****************#
  def show
		if params.has_key?(:id)
			if cookies.has_key?(:hotel_id)
					cookies.delete(:hotel_id)
			end
			cookies[:hotel_id] = params[:id]
		  @rooms = Room.find(:all,:conditions => { :hotel_id => params[:id]})
			@comments = Comment.find(:all,:conditions => { :hotel_id => params[:id]})
		else
			@rooms = Room.find(:all,:conditions => { :hotel_id => cookies[:hotel_id]})
			@comments = Comment.find(:all,:conditions => { :hotel_id => cookies[:hotel_id]})
		end
    respond_to do |format|
      format.html 
    end
  end

	#**************get user info*****************#
  def signup
    @user = User.new

    respond_to do |format|
      format.html
    end
  end
	
	#**************save user info*****************#
  def create
		hashed_password = Digest::MD5.hexdigest(params[:user][:password])
		@user = User.new({'name' => params[:user][:name],'email' => params[:user][:email],'password' => hashed_password,'phone' => params[:user][:phone]})
    respond_to do |format|
      if @user.save
        format.html { redirect_to signin_url, notice: 'User was successfully created.' }
      else
        format.html { render action: "signup" }
      end
    end
  end
 

	#****************signin***************#
	def signin
		respond_to do |format|
		  format.html # new.html.erb
		end
  	end

	#****************Authentication***************#
	def checkUser
		@user_auth = User.find(:all,:conditions => { :email => params[:email],:password => Digest::MD5.hexdigest(params[:password])})
		if !@user_auth.empty?
			user =  @user_auth[0]
			cookies[:user_id] =user.id
			cookies[:user_name] = user.name
			cookies[:admin] = user.admin
			redirect_to users_url
		else
			redirect_to signup_url
		end
  end


	#****************logout***************#
	def logout 
      cookies.delete(:user_name)
			cookies.delete(:user_id)
			cookies.delete(:admin)
			redirect_to users_url
  end

	#****************search***************#
	def search
      @hotels = Hotel.find(:all,:conditions => { :city => params[:city],:region => params[:region]})
			respond_to do |format|
        format.html    
    	end
  	end

	#****************Choose date***************#
	def chooseDate
		if cookies.has_key?(:user_name) 
			if cookies.has_key?(:hotel_id)
					cookies.delete(:hotel_id)
			end
			cookies[:hotel_id] = params[:id]
			respond_to do |format|
				format.html    
			end

		else
			redirect_to signin_url
		end
  end
 

 #***************get available rooms in specific hotel****************#
	def showAvailableRooms 
		if cookies.has_key?(:chkin)
				cookies.delete(:chkin)
				cookies.delete(:chkout)
		end
		cookies[:chkin] = params[:chkin]
		cookies[:chkout] = params[:chkout]

		@rooms = Room.find_by_sql ["SELECT * FROM rooms WHERE hotel_id = ? and id NOT IN (SELECT room_id FROM bookings WHERE hotel_id=(?) and (chkin between ? and ?) or (chkout between ? and ?) )", cookies[:hotel_id],cookies[:hotel_id],cookies[:chkin],cookies[:chkout],cookies[:chkin],cookies[:chkout]]

		respond_to do |format|
		  format.html 
		end
	end 


	#***************Book****************#
	def book
		if request.post?
			@rooms = params[:room]
			@rooms.each do |room|   
				Booking.new(:user_id => cookies[:user_id],:hotel_id => cookies[:hotel_id] ,:room_id => room,:chkin => cookies[:chkin],:chkout => cookies[:chkout]).save
			end
		else
			respond_to do |format|
					format.html 
			end
		end
	end 

#***************Comment****************#
	def addComment
		if request.post?
			room_id = params[:room_id]
			hotel_id = params[:hotel_id]
			comment = params[:comment]
			Comment.new(:user_id => cookies[:user_id],:user_name => cookies[:user_name],:hotel_id => hotel_id ,:room_id => room_id,:comment => comment).save
			redirect_to '/showRooms'
		end			
	end 


end
