class HotelsController < ApplicationController
  # GET /hotels
  # GET /hotels.json

  def index
		if cookies[:admin]
		  @hotels = Hotel.all
		  respond_to do |format|
		    format.html # index.html.erb
		    format.json { render json: @hotels }
		  end
		else
			redirect_to users_url
		end
  end

	  # GET /hotels/1
  # GET /hotels/1.json
  def show
		if cookies[:admin]
		  @hotel = Hotel.find(params[:id])
		  respond_to do |format|
		    format.html # show.html.erb
		    format.json { render json: @hotel }
		  end
		else
			redirect_to users_url
		end
  end

  # GET /hotels/new
  # GET /hotels/new.json
  def new
		if cookies[:admin]
		  @hotel = Hotel.new
		  respond_to do |format|
		    format.html # new.html.erb
		    format.json { render json: @hotel }
		  end
		else
			redirect_to users_url
  end

  # GET /hotels/1/edit
  def edit
	if cookies[:admin]
    		@hotel = Hotel.find(params[:id])
	else
		redirect_to users_url
	end
  end

  # POST /hotels
  # POST /hotels.json
  def create
		if cookies[:admin]
		  @hotel = Hotel.new(params[:hotel])
		  respond_to do |format|
		    if @hotel.save
		      format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
		      format.json { render json: @hotel, status: :created, location: @hotel }
		    else
		      format.html { render action: "new" }
		      format.json { render json: @hotel.errors, status: :unprocessable_entity }
		    end
		  end

		else
			redirect_to users_url
		end
  end

  # PUT /hotels/1
  # PUT /hotels/1.json
  def update
		if cookies[:admin]
		  @hotel = Hotel.find(params[:id])
		  respond_to do |format|
		    if @hotel.update_attributes(params[:hotel])
		      format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
		      format.json { head :no_content }
		    else
		      format.html { render action: "edit" }
		      format.json { render json: @hotel.errors, status: :unprocessable_entity }
		    end
		  end
		else
			redirect_to users_url
		end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
		if cookies[:admin]
		  @hotel = Hotel.find(params[:id])
		  @hotel.destroy

		  respond_to do |format|
		    format.html { redirect_to hotels_url }
		    format.json { head :no_content }
		  end
		end
		else
			redirect_to users_url
		end
	end

end
