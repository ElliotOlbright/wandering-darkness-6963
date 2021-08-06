class Garden < ApplicationRecord
  has_many :plots


  def garden_plants
    gardens.joins(:plots).select('plots.*')
  end
end
