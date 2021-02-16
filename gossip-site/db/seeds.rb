# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

50.times do |idx|
  c = City.create!(name: ['Paris','Berlin','Beijing','Dublin','Amsterdam','Oslo','Warsaw'].sample, zip_code: rand(10000..99999).to_s)
  u = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: c, description: Faker::TvShows::MichaelScott.quote,
      email: "user#{idx}@gossip.com", password: "password", age: rand(12..99))
  g = Gossip.create!(title: Faker::Book.title, user: u, content: Faker::TvShows::BojackHorseman.quote, user_id: u.id)
  t = Tag.create!(title: ['#code','#ruby','#thp','#britishcomedy','#life','#partyhard','#covid-19'].sample(rand(1..3)).join(", "), gossip: g)
  if idx == 0
    u2 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: c, description: Faker::TvShows::MichaelScott.quote,
      email: "new#{idx}@gossip.com", age: rand(12..99), password: "password")
    pm = PrivateMsg.create!(sender: u, recipient: u2, content: Faker::TvShows::RickAndMorty.quote)
  else
    pm = PrivateMsg.create!(sender: u, recipient: User.all[-2], content: Faker::TvShows::RickAndMorty.quote)
  end
end

puts "---------- Seeding complete ----------"
