class CreatePlantPlots < ActiveRecord::Migration[5.2]
  def change
    create_table :plant_plots do |t|
      t.references :garden, foreign_key: true
      t.references :plot, foreign_key: true
    end
  end
end