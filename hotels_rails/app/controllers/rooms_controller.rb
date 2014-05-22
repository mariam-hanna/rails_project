class RoomsController < ApplicationController
  # GET /rooms
  # GET /rooms.json
  def index
		if cookies[:admin]
				@rooms = Room.all
			  respond_to do |format|
					format.html # index.html.erb
				  format.json { render json: @rooms }
				end
		else
		  		redirect_to users_url
		end
	end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
		if cookies[:admin]
		  @room = Room.find(params[:id])
		  respond_to do |format|
		    format.html # show.html.erb
		    format.json { render json: @room }
		  end
		else
		  		redirect_to users_url
		end
  end

  # GET /rooms/new
  # GET /rooms/new.json
  def new
		if cookies[:admin]
		  @room = Room.new
		  respond_to do |format|
		    format.html # new.html.erb
		    format.json { render json: @room }
		  end
		else
		  		redirect_to users_url
		end
  end

  # GET /rooms/1/edit
  def edit
		if cookies[:admin]
    	@room = Room.find(params[:id])
		else
		  		redirect_to users_url
		end
  end

  # POST /rooms
  # POST /rooms.json
  def create
		if cookies[:admin]
		  @room = Room.new(params[:room])
		  respond_to do |format|
		    if @room.save
		      format.html { redirect_to @room, notice: 'Room was successfully created.' }
		      format.json { render json: @room, status: :created, location: @room }
		    else
		      format.html { render action: "new" }
		      format.json { render json: @room.errors, status: :unprocessable_entity }
		    end
    end
		else
		  		redirect_to users_url
		end
  end


  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
		if cookies[:admin]
		  @room = Room.find(params[:id])
		  respond_to do |format|
		    if @room.update_attributes(params[:room])
		      format.html { redirect_to @room, notice: 'Room was successfully updated.' }
		      format.json { head :no_content }
		    else
		      format.html { render action: "edit" }
		      format.json { render json: @room.errors, status: :unprocessable_entity }
		    end
		  end
		else
		  		redirect_to users_url
		end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
		if session[:admin]
		  @room = Room.find(params[:id])
		  @room.destroy

		  respond_to do |format|
		    format.html { redirect_to rooms_url }
		    format.json { head :no_content }
		  end
		end
	else
		redirect_to users_url
	end

end

