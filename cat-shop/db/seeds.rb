# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Item.destroy_all
User.destroy_all

url_chatons = ["https://images.pexels.com/photos/320014/pexels-photo-320014.jpeg",
  "https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg",
  "https://images.pexels.com/photos/730896/pexels-photo-730896.jpeg",
  "https://images.pexels.com/photos/96938/pexels-photo-96938.jpeg",
  "https://images.pexels.com/photos/1056251/pexels-photo-1056251.jpeg",
  "https://images.pexels.com/photos/1643457/pexels-photo-1643457.jpeg",
  "https://images.pexels.com/photos/1317844/pexels-photo-1317844.jpeg",
  "https://images.pexels.com/photos/1056252/pexels-photo-1056252.jpeg",
  "https://images.pexels.com/photos/1472999/pexels-photo-1472999.jpeg",
  "https://images.pexels.com/photos/479009/pexels-photo-479009.jpeg",
  "https://images.pexels.com/photos/1981111/pexels-photo-1981111.jpeg",
  "https://images.pexels.com/photos/2835623/pexels-photo-2835623.jpeg",
  "https://images.pexels.com/photos/731553/pexels-photo-731553.jpeg",
  "https://images.pexels.com/photos/1447884/pexels-photo-1447884.jpeg",
  "https://images.pexels.com/photos/1096091/pexels-photo-1096091.jpeg",
  "https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg",
  "https://images.pexels.com/photos/691583/pexels-photo-691583.jpeg",
  "https://images.pexels.com/photos/45170/kittens-cat-cat-puppy-rush-45170.jpeg",
  "https://images.pexels.com/photos/1643456/pexels-photo-1643456.jpeg",
  "https://images.pexels.com/photos/160755/kittens-cats-foster-playing-160755.jpeg",
  "https://images.pexels.com/photos/3333538/pexels-photo-3333538.jpeg"
]
n = 0

# Seed Item
20.times do
  Item.create!(
    title: Faker::GreekPhilosophers.name,
    price: Faker::Number.decimal(l_digits: 2),
    image_url: url_chatons[n],
    description: Faker::Hipster.sentence(word_count: 4)
  )
  n += 1
end


# Seed User
5.times do
  User.create!(
    email: Faker::Internet.safe_email,
    password: "chatons"
  )
end

# Seed SuperUser
User.create!(email: 'animalmatching2020@gmail.com', password: "chatons", superuser: true)