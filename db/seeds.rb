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
User.create(name: "Kenny Hearn", username: "kenny", password: "password")
User.create(name: "Sarah Sweat", username: "sarah", password: "password")
User.create(name: "Larson Laidlaw", username: "larson", password: "password")

chipotle = Restaurant.create(name: "Chipotle", address: "2 Broadway, New York, NY 10004", restaurant_type: "Fast Casual", cuisine: "Mexican")
subway = Restaurant.create(name: "Subway", address: "11 Broadway Unit #155, New York, NY 10004", restaurant_type: "Fast Food", cuisine: "Sandwich")
potbelly = Restaurant.create(name: "Potbelly", address: "90 Broad St, New York, NY 10004", restaurant_type: "Fast Casual", cuisine: "Sandwich")
sophies = Restaurant.create(name: "Sophies Cuban Cuisine", address: "73 New St, New York, NY 10004", restaurant_type: "Fast Casual", cuisine: "Cuban")
burger_king = Restaurant.create(name: "Burger King", address: "16 Beaver St, New York, NY 10004", restaurant_type: "Fast Food", cuisine: "American")
pret = Restaurant.create(name: "Pret A Manger", address: "60 Broad Street, New York, New York 10004", restaurant_type: "Fast Casual", cuisine: "Sandwich")
aubonpain = Restaurant.create(name: "Au Bon Pain", address: "60 Broad Street, New York, New York, 10004", restaurant_type: "Fast Casual", cuisine: "Sandwich")
tgifridays = Restaurant.create(name: "TGI FRidays", address: "47 Broadway, New York, NY 10006", restaurant_type: "Sit Down", cuisine: "American")


Review.create(restaurant_id: 1, user_id: 1, wait: 5, rating: 5, content: "Chipotle is very delicious and I enjoy it very much.")
Review.create(restaurant_id: 2, user_id: 2, wait: 1, rating: 1, content: "There was no line because everyone else knows this place sucks.")
Review.create(restaurant_id: 3, user_id: 3, wait: 8, rating: 5, content: "Who would eat Subway when you got Potbelly? Get the soup!")
Review.create(restaurant_id: 4, user_id: 1, wait: 1, rating: 1, content: "I love the empanadas")
Review.create(restaurant_id: 5, user_id: 2, wait: 5, rating: 4, content: "Get it made your way!")
Review.create(restaurant_id: 6, user_id: 3, wait: 1, rating: 1, content: "This place is v v fancy!")
Review.create(restaurant_id: 7, user_id: 3, wait: 10, rating: 4, content: "If you're looking for something healthy, this is the place.")
Review.create(restaurant_id: 8, user_id: 2, wait: 30, rating: 1, content: "2 words. Mozzarella Sticks!!!!")
Review.create(restaurant_id: 1, user_id: 1, wait: 4, rating: 2, content: "It was a little better this time. ")

Cohort.create(name: "042417")
Cohort.create(name: "051517")
Cohort.create(name: "060517")
Cohort.create(name: "062617")

Experience.create(restaurant: chipotle, date: "2017-06-23T012:00:00-0600")
Experience.create(restaurant: subway, date: "2017-06-26T012:00:00-0600")
Experience.create(restaurant: potbelly, date: "2017-06-26T012:00:00-0600")
