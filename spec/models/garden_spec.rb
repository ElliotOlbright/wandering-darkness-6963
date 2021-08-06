require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end
  before :each do
    @garden1 = Garden.create!(name: 'Florida Orchirds', organic: true)
    @garden2 = Garden.create!(name: 'Idoho', organic: true)

    

    @plot1 = Plot.create!(number: 1, size: 'Small', direction: 'south', garden_id: @garden1.id)
    @plot2 = Plot.create!(number: 2, size: 'Medium', direction: 'East', garden_id: @garden1.id)
    @plot3 = Plot.create!(number: 3, size: 'Large', direction: 'North', garden_id: @garden2.id)

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
  describe 'methods' do 
    describe '::garden_plants' do 
      it ' can display all plants related to that garden' do 
        require "pry"; binding.pry
        expected = [@plant1, @plant2, @plant3, @plant4]

        expect(@garden1.garden_plants).to eq(expected)
      end 
    end
  end 
end
