# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require 'faker'
names = [
  ["John", "Doe"],
  ["Jane", "Smith"],
  ["Alice", "Johnson"],
  ["Bob", "Brown"],
  ["Charlie", "Davis"],
  ["Eve", "White"],
  ["Frank", "Black"],
  ["Grace", "Green"],
  ["Hannah", "Blue"],
  ["Ivy", "Red"]
]



names.each do |first_name, last_name|
  Author.create(
    name: first_name,
    last_name: last_name,
    email: Faker::Internet.email,
    age: rand(20..70),
    country: Faker::Address.country,
    category_id: 10 
  )
end

    

puts "10 authors created with category_id 10." 