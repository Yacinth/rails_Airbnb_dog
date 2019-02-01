# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# Examples:
# #
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "destroy database.."
Dogsitter.destroy_all
Dog.destroy_all
City.destroy_all
Stroll.destroy_all
puts "ok"
puts "delete from sqlite_sequence..."
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'dogs'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'dogsitters'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cities'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'strolls'")
puts "Sucess, old DB deleted"
puts ""

puts "generate new DB..."
puts ""
puts "_______________________________"
puts ""

10.times do
	city = City.create!(city_name: Faker::Address.city)
  puts "city #{city.city_name}"
end

puts "_______________________________"
puts ""

15.times do 
  dog = Dog.create!(city_id: City.all.sample.id, name: Faker::Creature::Dog.name)
  puts "Good chien-chien #{dog.name} need a stroll"
  puts ""
end

puts "_______________________________"
puts ""

10.times do 
  dogsitter = Dogsitter.create!(city_id: City.all.sample.id, name: Faker::TvShows::RickAndMorty.character)
  puts "#{dogsitter.name} is ready to take your doggo"
  puts ""
end

puts "_______________________________"
puts ""

15.times do 
  stroll = Stroll.create!(dog_id: Dog.all.sample.id, dogsitter_id: Dogsitter.all.sample.id, date: Faker::Date.forward(42))
  puts "A stroll in the fresh air at #{stroll.date}"
  puts ""
end

puts "_______________________________"
puts ""
puts "ALL GOOD, DB fresh and ready to be explored like your life"