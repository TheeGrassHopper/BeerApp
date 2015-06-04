class BeersController < ApplicationController
	# list  all the Beers
	def index
		@beers = Beer.all
	end
#  show data for one beer
	def show
		@beer = Beer.find(params[:id])

	end
#  Displays from for creating a new beet
	def new
		@beer = Beer.new
	end
	#  displays form for editing an existing beer
	def edit
		@beer = Beer.find(params[:id])
	end
#  processes data from the new beer from and create a beer
	def create
    @beer = Beer.new(beer_params.merge(:user_id => @current_user.id))
    
    respond_to do |format|
      if @beer.save
        format.html { redirect_to @beer, notice: 'beer was successfully created.' }
        else
        format.html{ render :new}
    	end
    end
  end

# processes data from the edit beer from and updates the beer
	def update
		respond_to do |format|
		  if @beer.update(beer_params)
		    format.html { redirect_to @beer, notice: 'Beer was successfully updated.' }
		    format.json { render :show, status: :ok, location: @beer}
		  else
		    format.html { render :edit }
		    format.json { render json: @beer.errors, status: :unprocessable_entity }
		  end
		end
  	end

	# DELETE /beers/1
	# DELETE //1.json
	def destroy
		@beer.destroy
		respond_to do |format|
	 		format.html { redirect_to beers_url, notice: 'Beer was successfully destroyed.' }
	 		format.json { head :no_content }
		end
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer
      @beer = Beer.find(params[:id])
    end

    # Never trust parameters from the scary Internet, only allow the white list through.
    def beer_params
      params.require(:beer).permit(:brewer, :name, :beer_type, :abv, :user_id)
    end
end