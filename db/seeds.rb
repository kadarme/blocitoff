require 'faker'

# Create Users
5.times do
  user = User.new(
    name:      Faker::Name.name,
    email:     Faker::Internet.email,
    password:  Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
  users = User.all

# Create Lists
5.times do
  list = List.create!(
    user:      users.sample,
    title:     Faker::Lorem.sentence
    ) 
end
  lists = List.all

# Create Items
20.times do
   item = Item.create!(
     list:      lists.sample,
     name:      Faker::Lorem.sentence
    )
  item.update_attributes!(created_at: rand(10.minutes .. 6.days).ago)
end
  items = Item.all

# Create a member
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld' 
  )
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"