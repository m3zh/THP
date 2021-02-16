# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


30.times do |idx|
  u = User.create!(first_name: Faker::Name.name, last_name: Faker::Name.last_name,email: "anotheruser#{idx}@yopmail.com",
      password: "password", encrypted_password: "password", description: Faker::TvShows::TheITCrowd.quote)
  e = Event.create!(start_date: Faker::Time.forward(days: 14, period: :evening, format: :short), duration: [30,45,60].sample,
      location: ['Meeting Room','Cinema','Pub','Swimming pool','Private House','Club','Park'].sample,
      title: ['Meet up','Hanging out','Chatting','Work meeting','Romantic date','Sport activity'].sample,
      description: Faker::TvShows::BojackHorseman.quote, price: rand(1..1000), admin: u)
  a = Attendance.create!(stripe_customer_id: Faker::Business.credit_card_number, event: e)
end

puts "----------------- Seeding Complete -----------------"
