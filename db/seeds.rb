# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)
User.create name:  "A",
            email: "a@gmail.com",
            password:  "123456",
            password_confirmation: "123456",
            supervisor: true

10.times do
  name = Faker::Company.name
  description = Faker::Lorem.sentence
  Subject.create! name: name,
    description: description,
    status: "Start"
end

10.times do
  name = Faker::Company.name
  description = Faker::Lorem.sentence
  Course.create! name: name,
    description: description,
    status: "Start"
end

10.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  User.create! name:  name,
            email: email,
            password:  "123456",
            password_confirmation: "123456",
            supervisor: false
end
