require 'rails_helper' 

RSpec.describe 'Garden Show Page' do 
  before :each do
    @garden = Garden.create!(name: 'Florida Orchirds', organic: true)

    @plot1 = Plot.create!(number: 1, size: 'Small', direction: 'south', garden_id: @garden.id)
    @plot2 = Plot.create!(number: 2, size: 'Medium', direction: 'East', garden_id: @garden.id)
    @plot3 = Plot.create!(number: 3, size: 'Large', direction: 'North', garden_id: @garden.id)

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

    visit "/gardens/#{@garden.id}"
  end

  it 'is on the right page' do 
    expect(current_path).to eq("/gardens/#{@garden.id}")
  end 
end 