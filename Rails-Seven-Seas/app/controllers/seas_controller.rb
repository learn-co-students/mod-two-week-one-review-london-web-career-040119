
class SeasController < ApplicationController
  before_action :find_sea, except: [:index, :new, :create]
  
  def index
    @seas = Sea.all
  end

  def show
  end
  
  def new
    @sea = Sea.new
  end
  
  def edit
  end

  def create
    @sea = Sea.new(sea_params)
    if @sea.save
      flash[:success] = "Sea successfully created"
      redirect_to @sea
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def update
    if @sea.update_attributes(sea_params)
      flash[:success] = "Sea was successfully updated"
      redirect_to @sea
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end
  
  def destroy
    if @sea.destroy
      flash[:success] = "Sea was successfully deleted"
      redirect_to @seas_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @seas_path
    end
  end
  
  private
    # In controller actions, use this private method to access sea params from forms.
    # Example: @sea.update(sea_params)
    # check the return value of sea_params to see what you're working with!
    def sea_params
      params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
    end

    def find_sea
      @sea = Sea.find(params[:id])
    end
    
end
  