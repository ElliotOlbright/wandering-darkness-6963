require 'rails_helper' 

RSpec.describe 'Garden Show Page' do 
  before :each do
    @garden1 = Garden.create!(name: 'Florida Orchirds', organic: true)
    @garden2 = Garden.create!(name: 'Florida Orchirds', organic: true)


    @plot1 = Plot.create!(number: 1, size: 'Small', direction: 'south', garden_id: @garden1.id)
    @plot2 = Plot.create!(number: 2, size: 'Medium', direction: 'East', garden_id: @garden1.id)
    @plot3 = Plot.create!(number: 3, size: 'Large', direction: 'North', garden_id: @garden2.id)

    @plant1 = Plant.create!(name: 'Oranges', description: 'Likes sun', days_to_harvest: 120)
    @plant2 = Plant.create!(name: 'Apples', description: 'Likes sun', days_to_harvest: 90)
    @plant3 = Plant.create!(name: 'Peaches', description: 'Likes sun', days_to_harvest: 80)
    @plant4 = Plant.create!(name: 'Lemons', description: 'Likes sun', days_to_harvest: 70)
    @plant5 = Plant.create!(name: 'Apricots', description: 'Likes sun', days_to_harvest: 100)
    @plant6 = Plant.create!(name: 'Mangos', description: 'Likes sun', days_to_harvest: 100)

    @pp1 = PlantPlot.create!(plant_id: @plant1.id, plot_id: @plot1.id)
    @pp2 = PlantPlot.create!(plant_id: @plant2.id, plot_id: @plot1.id)
    @pp3 = PlantPlot.create!(plant_id: @plant3.id, plot_id: @plot2.id)
    @pp4 = PlantPlot.create!(plant_id: @plant4.id, plot_id: @plot2.id)
    @pp5 = PlantPlot.create!(plant_id: @plant5.id, plot_id: @plot3.id)
    @pp6 = PlantPlot.create!(plant_id: @plant6.id, plot_id: @plot3.id)

    visit "/gardens/#{@garden1.id}"
  end

  it 'is on the right page' do 
    expect(current_path).to eq("/gardens/#{@garden1.id}")
  end 

  it 'displays garden name' do 
    expect(page).to have_content("Garden: #{@garden1.name}")
  end

  it 'displays all plants in that garden' do 
    save_and_open_page
    expect(page).to have_content(@plant2.name)
    expect(page).to have_content(@plant3.name)
    expect(page).to have_content(@plant4.name)
    expect(page).to_not have_content(@plant1.name)
    expect(page).to_not have_content(@plant5.name)
    expect(page).to_not have_content(@plant6.name)
  end 
end 