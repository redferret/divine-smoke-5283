class Plot < ApplicationRecord
  has_and_belongs_to_many :plants
  belongs_to :garden
end
