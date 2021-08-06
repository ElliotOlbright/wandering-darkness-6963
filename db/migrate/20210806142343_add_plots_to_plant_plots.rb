class AddPlotsToPlantPlots < ActiveRecord::Migration[5.2]
  def change
    add_reference :plant_plots, :plant, foreign_key: true
  end
end
