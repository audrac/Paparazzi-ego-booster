require 'faker'
require 'open-uri'
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

images = [
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732289/seeds%20images/1_t93qfw.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732291/seeds%20images/2_yf19u6.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732294/seeds%20images/3_zdrq14.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732292/seeds%20images/4_sr8guj.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732288/seeds%20images/5_mhtgbc.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732288/seeds%20images/6_x90iem.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732289/seeds%20images/7_g0pvwb.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732289/seeds%20images/8_pxtom0.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732290/seeds%20images/9_chzbfb.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732295/seeds%20images/10_jyb10a.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732292/seeds%20images/11_tke9o5.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732290/seeds%20images/12_rhniyx.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732296/seeds%20images/13_u6jqrh.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732297/seeds%20images/14_h8f3wk.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732296/seeds%20images/15_m5int6.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732292/seeds%20images/16_cc1wg3.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732300/seeds%20images/17_qnefzv.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732295/seeds%20images/18_fxluun.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732300/seeds%20images/19_d77hsq.jpg",
  "https://res.cloudinary.com/dsi8boj6y/image/upload/v1676732292/seeds%20images/20_bvvcmm.jpg"
]

20.times do
  paparazzi = Paparazzi.new(
    name: Faker::FunnyName.name,
    price: rand(15..20),
    rating: rand(3..5),
    location: Faker::Address.country,
    style: Faker::TvShows::MichaelScott.quote,
    user_id: User.all.sample.id,
    description: Faker::Lorem.paragraph(sentence_count: 30)
  )

  file = URI.parse(images.sample).open
  paparazzi.photo.attach(
    io: file,
    filename: "picture"
  )

  paparazzi.save!
end
puts "created #{Paparazzi.all.length} paparazzis"
