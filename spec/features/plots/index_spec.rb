require 'rails_helper' 

RSpec.describe 'Plots Index Page' do 
  before :each do 
    @plot1 = Plot.create!(number: 1, size: 'Small', direction: 'south')
    @plot2 = Plot.create!(number: 2, size: 'Medium', direction: 'East')
    @plot3 = Plot.create!(number: 3, size: 'Large', direction: 'North')

    @plant1 = Plant.create!(name: 'Oranges', description: 'Likes sun', days_to_harvest: '90 days')
    @plant2 = Plant.create!(name: 'Apples', description: 'Likes sun', days_to_harvest: '90 days')
    @plant3 = Plant.create!(name: 'Peaches', description: 'Likes sun', days_to_harvest: '90 days')
    @plant4 = Plant.create!(name: 'Lemons', description: 'Likes sun', days_to_harvest: '90 days')
    @plant5 = Plant.create!(name: 'Apricots', description: 'Likes sun', days_to_harvest: '90 days')
    @plant6 = Plant.create!(name: 'Mangos', description: 'Likes sun', days_to_harvest: '90 days')

    @pp1 = PlantPlot.create!(plant_id: @plant1.id, plot_id: @plot1.id)
    @pp2 = PlantPlot.create!(plant_id: @plant2.id, plot_id: @plot1.id)
    @pp3 = PlantPlot.create!(plant_id: @plant3.id, plot_id: @plot2.id)
    @pp4 = PlantPlot.create!(plant_id: @plant4.id, plot_id: @plot2.id)
    @pp5 = PlantPlot.create!(plant_id: @plant5.id, plot_id: @plot3.id)
    @pp6 = PlantPlot.create!(plant_id: @plant6.id, plot_id: @plot3.id)

  

  end

  it ' can list all plot numbers' do 

  end 

  it 'can display each plots plants' do 
    
  end 
end