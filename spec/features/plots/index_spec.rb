require 'rails_helper' 

RSpec.describe 'Plots Index Page' do 
  before :each do
    @garden = Garden.create!(name: 'Florida Orchirds', organic: true)

    @plot1 = Plot.create!(number: 1, size: 'Small', direction: 'south', garden_id: @garden.id)
    @plot2 = Plot.create!(number: 2, size: 'Medium', direction: 'East', garden_id: @garden.id)
    @plot3 = Plot.create!(number: 3, size: 'Large', direction: 'North', garden_id: @garden.id)

    @plant1 = Plant.create!(name: 'Oranges', description: 'Likes sun', days_to_harvest: 100)
    @plant2 = Plant.create!(name: 'Apples', description: 'Likes sun', days_to_harvest: 100)
    @plant3 = Plant.create!(name: 'Peaches', description: 'Likes sun', days_to_harvest: 100)
    @plant4 = Plant.create!(name: 'Lemons', description: 'Likes sun', days_to_harvest: 100)
    @plant5 = Plant.create!(name: 'Apricots', description: 'Likes sun', days_to_harvest: 100)
    @plant6 = Plant.create!(name: 'Mangos', description: 'Likes sun', days_to_harvest: 100)

    @pp1 = PlantPlot.create!(plant_id: @plant1.id, plot_id: @plot1.id)
    @pp2 = PlantPlot.create!(plant_id: @plant2.id, plot_id: @plot1.id)
    @pp3 = PlantPlot.create!(plant_id: @plant3.id, plot_id: @plot2.id)
    @pp4 = PlantPlot.create!(plant_id: @plant4.id, plot_id: @plot2.id)
    @pp5 = PlantPlot.create!(plant_id: @plant5.id, plot_id: @plot3.id)
    @pp6 = PlantPlot.create!(plant_id: @plant6.id, plot_id: @plot3.id)

    visit '/plots'
  end

  it 'is on the right page' do 
     expect(current_path).to eq('/plots')
  end 

  it ' can display all plot numbers' do 
    expect(page).to have_content("Plot Number: #{@plot1.number}")
    expect(page).to have_content("Plot Number: #{@plot2.number}")
    expect(page).to have_content("Plot Number: #{@plot3.number}")

  end

  it 'can display each plots plants' do 
    within("#plot-#{@plot1.id}") do 
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
    end 

    within("#plot-#{@plot2.id}") do 
      expect(page).to have_content(@plant3.name)
      expect(page).to have_content(@plant4.name)
    end 

    within("#plot-#{@plot3.id}") do 
      expect(page).to have_content(@plant5.name)
      expect(page).to have_content(@plant6.name)
    end 
  end 

  it 'can WONT display each plots plants' do 
    within("#plot-#{@plot1.id}") do 
      expect(page).to_not have_content(@plant3.name)
      expect(page).to_not have_content(@plant4.name)
    end 

    within("#plot-#{@plot2.id}") do 
      expect(page).to_not have_content(@plant2.name)
      expect(page).to_not have_content(@plant5.name)
    end 

    within("#plot-#{@plot3.id}") do 
      expect(page).to_not have_content(@plant3.name)
      expect(page).to_not have_content(@plant4.name)
    end 
  end 

  it 'can remove plant from plot' do 
    within("#plot-#{@plot1.id}") do 
      within("#plant-#{@plant1.id}") do 
        click_link 'Remove Plant'

        expect(current_path).to eq('/plots')
      end 
      expect(page).to_not have_content(@plant1.name)
    end 
  end 

  it 'removes plant with out deleting record' do 
    expect(Plant.all.length).to eq(6)
    within("#plot-#{@plot1.id}") do 
      within("#plant-#{@plant1.id}") do 
        click_link 'Remove Plant'

        expect(current_path).to eq('/plots')
      end 
      expect(page).to_not have_content(@plant1.name)
      expect(Plant.all.length).to eq(6)
    end 
  end 
end