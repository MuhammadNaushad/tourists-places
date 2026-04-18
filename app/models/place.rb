class Place < ApplicationRecord
  validates :name, :description, :city, :state, :country, :latitude, :longitude, presence: true
  has_many :images, as: :imageable
end
