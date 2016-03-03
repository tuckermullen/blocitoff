require 'faker'

# Creates random users
25.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "password"
    )
  user.skip_confirmation!
  user.save!
end

users = User.all

#Creates random items
50.times do
  Item.create!(
    user: users.sample,
    name: Faker::Name.name,
    created_at: Faker::Date.backward(21)
    )
end

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'mullentucker@gmail.com',
  password: 'password',
)

puts "Seeding finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
