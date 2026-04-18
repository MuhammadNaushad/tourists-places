# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

1000.times do |i|
  Place.create(
    name: Faker::Address.street_address,
    description: Faker::Lorem.paragraph,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
  )
  puts "Place #{i+1} created successfully!"
  10.times do |j|
    Place.last.images.create(
      url: Faker::LoremFlickr.image(size: "300x300", search_terms: [ 'nature' ]),
      imageable_type: "Place",
      imageable_id: Place.last.id
    )
    puts "Image #{j+1} for Place #{i+1} created successfully!"
  end
end

# 1000.times do |i|
#   Book.create(
#     name: Faker::Book.title,
#     author: Faker::Book.author,
#     publisher: Faker::Book.publisher,

#   )
#   puts "Book #{i+1} created successfully!"
# end

# 1000.times do |i|
#   Currency.create(
#     name: Faker::Currency.name,
#     code: Faker::Currency.code,
#     symbol: Faker::Currency.symbol,

#   )
#   puts "Currency #{i+1} created successfully!"
# end
