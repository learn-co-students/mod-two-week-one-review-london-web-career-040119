class SeasController < ApplicationController
  #define your controller actions here

  def index
    @seas = Sea.all
  end

  def show
    @sea = Sea.all.find(params[:id])
  end

  def edit
    @sea = Sea.all.find(params[:id])
  end

  def update
    @sea = Sea.all.find(params[:id])
    # @sea.update(params[:sea].keys, params[:sea].values)
    @sea.update(name: params[:sea]["name"], temperature: params[:sea]["temperature"], bio: params[:sea]["bio"], mood: params[:sea]["mood"], favorite_color: params[:sea]["favorite_color"], scariest_creature: params[:sea]["scariest_creature"], has_mermaids: params[:sea]["has_mermaids"], image_url: params[:sea]["image_url"])
    redirect_to sea_path(@sea)
  end

  def new
    @sea = Sea.new
  end

  def create
    @sea = Sea.new
    @sea.name = params[:sea]["name"]
    @sea.temperature = params[:sea]["temperature"]
    @sea.bio = params[:sea]["bio"]
    @sea.mood = params[:sea]["mood"]
    @sea.favorite_color = params[:sea]["favorite_color"]
    @sea.scariest_creature = params[:sea]["scariest_creature"]
    @sea.has_mermaids = params[:sea]["has_mermaids"]
    @sea.image_url = params[:sea]["image_url"]
    @sea.save
    redirect_to sea_path(@sea)
  end


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
