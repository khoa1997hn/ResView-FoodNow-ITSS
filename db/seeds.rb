# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
20.times do |u|
  user = User.new
  user.username = "User"+u.to_s
  user.email = "user"+u.to_s+"@user.com"
  user.password = '123456'
  user.password_confirmation = "123456"
  user.skip_confirmation!
  user.save!
end

20.times do |r|
  restaurant = Restaurant.new
  restaurant.name = "Restaurant " + r.to_s
  restaurant.address = "Thanh Xuan, Ha Noi"
  restaurant.phone = 1234567890
  restaurant.description = "description of restaurant " + r.to_s
  10.times do |f|
    food = restaurant.foods.build
    food.name = "Food " + f.to_s
    food.price = 100000
    food.save!
  end
  10.times do |v|
    vote = User.first.votes.build
    vote.star_num = rand(1..5)
    vote.restaurant = restaurant
    vote.save!
  end
  restaurant.vote_num = restaurant.votes.average(:star_num).to_f
  restaurant.save!
end
