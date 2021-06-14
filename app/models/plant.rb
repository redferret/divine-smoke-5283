class Plant < ApplicationRecord
  has_and_belongs_to_many :plots

  def self.plants_for_garden(garden_id)
    joins('INNER JOIN plants_plots ON plants_plots.plant_id = plants.id')
    .joins('INNER JOIN plots ON plants_plots.plot_id = plots.id')
    .joins('INNER JOIN gardens ON plots.garden_id = gardens.id')
    .where(plots: {garden_id: garden_id})
    .where('plants.days_til_harvest < 100')
    .distinct
  end
end
