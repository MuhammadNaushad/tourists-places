class Place < ApplicationRecord
  validates :name, :description, :city, :state, :country, :latitude, :longitude, presence: true
end
