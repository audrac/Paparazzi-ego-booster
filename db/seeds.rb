require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning up database..."
Paparazzi.destroy_all
puts "Database cleaned"

20.times do |i|
  paparazzi = Paparazzi.create!(
    name: Faker::FunnyName.name,
    price: rand(15..20),
    rating: rand(0..5),
    location: "#{Faker::Address.country}, #{Faker::Address.city}",
    style: Faker::Hipster.sentence(word_count: 3)
  )
  # paparazzi.photo.attach(
  #   filename:

  # )
  # puts "created #{i} paparazzis"
end
