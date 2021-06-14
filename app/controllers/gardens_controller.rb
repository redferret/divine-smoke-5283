class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
    @garden_plants = Plant.plants_for_garden(@garden.id)
  end
end