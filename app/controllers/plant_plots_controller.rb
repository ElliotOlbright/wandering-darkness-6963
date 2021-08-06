class PlantPlotsController < ApplicationController 
  def destroy
    pp = PlantPlot.find(params[:id])

    pp.destroy
    redirect_to '/plots'
  end
end