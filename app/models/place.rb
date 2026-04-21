class Place < ApplicationRecord
  validates :name, :description, :city, :state, :country, :latitude, :longitude, presence: true
  has_many :images, as: :imageable

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes["url"].blank? }
end
