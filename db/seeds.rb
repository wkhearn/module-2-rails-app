# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Ed Sheeran", username: "eddie", password: "password")
User.create(name: "Kenny G", username: "kennyg", password: "password")
User.create(name: "Lebron James", username: "lebron", password: "password")

Restaurant.create(name: "Chipotle", address: "123 Test Street", restaurant_type: "Fast Casual", cuisine: "Mexican")
Restaurant.create(name: "Subway", address: "456 Test Street", restaurant_type: "Fast Food", cuisine: "Sandwich")
Restaurant.create(name: "Potbelly", address: "989 Test Street", restaurant_type: "Fast Casual", cuisine: "Gourmet Sandwich")

Review.create(restaurant_id: 1, user_id: 1, wait: 5, rating: 5, content: "Chipotle is very delicious and I enjoy it very much.")
Review.create(restaurant_id: 2, user_id: 2, wait: 1, rating: 1, content: "There was no line because everyone else knows this place sucks.")
Review.create(restaurant_id: 3, user_id: 3, wait: 8, rating: 5, content: "Who would eat Subway when you got Potbelly? Get the soup!")
