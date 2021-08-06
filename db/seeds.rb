# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@garden1 = Garden.create!(name: 'Florida Orchirds', organic: true)
@garden2 = Garden.create!(name: 'Idoho', organic: true)

@plot1 = Plot.create!(number: 1, size: 'Small', direction: 'south', garden_id: @garden1.id)
@plot2 = Plot.create!(number: 2, size: 'Medium', direction: 'East', garden_id: @garden1.id)
@plot3 = Plot.create!(number: 3, size: 'Large', direction: 'North', garden_id: @garden2.id)

@plant1 = Plant.create!(name: 'Oranges', description: 'Likes sun', days_to_harvest: 100)
@plant2 = Plant.create!(name: 'Apples', description: 'Likes sun', days_to_harvest: 90)
@plant3 = Plant.create!(name: 'Peaches', description: 'Likes sun', days_to_harvest: 80)
@plant4 = Plant.create!(name: 'Lemons', description: 'Likes sun', days_to_harvest: 120)
@plant5 = Plant.create!(name: 'Apricots', description: 'Likes sun', days_to_harvest: 120)
@plant6 = Plant.create!(name: 'Mangos', description: 'Likes sun', days_to_harvest: 115)

@pp1 = PlantPlot.create!(plant_id: @plant1.id, plot_id: @plot1.id)
@pp2 = PlantPlot.create!(plant_id: @plant2.id, plot_id: @plot1.id)
@pp3 = PlantPlot.create!(plant_id: @plant3.id, plot_id: @plot2.id)
@pp4 = PlantPlot.create!(plant_id: @plant4.id, plot_id: @plot2.id)
@pp5 = PlantPlot.create!(plant_id: @plant5.id, plot_id: @plot3.id)
@pp6 = PlantPlot.create!(plant_id: @plant6.id, plot_id: @plot3.id)