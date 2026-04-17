class Book < ApplicationRecord
  validates :name, :author, :publisher,  presence: true
end
