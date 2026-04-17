class Currency < ApplicationRecord
  validates :name, :symbol, :code, presence: true
end
