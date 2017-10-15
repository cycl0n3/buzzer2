# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts "CREATED ADMIN USER: #{user.email}"

10.times {
  user = User.new(email: Faker::Internet.email, password: 'password', role: User.roles[:user])

  user.save!
  puts "CREATED USER: #{user.email}"
}

users = User.all

100.times {
  random = Random.new
  user = users[random.rand(0..users.size-1)]

  article = Article.new(title: Faker::Food.dish, user: user)
  article.save!

  puts "CREATED ARTICLE: #{article.title} FOR USER #{user.email}"
}
