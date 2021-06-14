class PlotsController < ApplicationController
  def index
    @garden = Garden.find(params[:garden_id])
    @plots = Plot.all
  end
end