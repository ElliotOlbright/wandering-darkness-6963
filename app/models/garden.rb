class Garden < ApplicationRecord
  has_many :plots
  has_many :plant_plots, through: :plots 
  has_many :plants, through: :plots


  def garden_plants
    gardens.joins(:plots).select('plots.*').where
  end
end