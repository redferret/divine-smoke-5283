class PlantsController < ApplicationController
  def remove_plant
    @garden = Garden.find(params[:garden_id])

    @plot = Plot.find(params[:plot_id])
    @plant = @plot.plants.find(params[:id])
    @plot.plants.delete(@plant)
    
    redirect_to garden_plots_path(@garden)
  end
end
