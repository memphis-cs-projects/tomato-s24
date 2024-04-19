# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users

user1 = User.create!(
  email:    'alice@email.com',
  password: 'password'
)

user2 = User.create!(
  email:    'bob@email.com',
  password: 'password'
)

user3 = User.create!(
  email: 'vishal@email.com',
  password: 'password',
  vendor: true
)


zord1 = Zord.create!(
  name: "Zord 1",
  theme: "Theme 1",
  material: "Material 1",
  capacity: 5,
  ability: "Ability 1",
  price: 49.99,
  description: "Description for Zord 1",
  quantity: 15
)

zord1.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord1.jpeg')),
filename: 'zord1.jpeg')

zord2 = Zord.create!(
  name: "Zord 2",
  theme: "Theme 2",
  material: "Material 2",
  capacity: 8,
  ability: "Ability 2",
  price: 79.99,
  description: "Description for Zord 2",
  quantity: 10
)

zord2.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord2.jpeg')),
filename: 'zord2.jpeg')

zord3 = Zord.create!(
  name: "Zord 3",
  theme: "Theme 2",
  material: "Material 1",
  capacity: 2,
  ability: "Ability 4",
  price: 29.99,
  description: "Description for Zord 3",
  quantity: 15
)

zord3.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord3.jpg')),
filename: 'zord3.jpg')

zord4 = Zord.create!(
  name: "Zord 4",
  theme: "Theme 1",
  material: "Material 2",
  capacity: 15,
  ability: "Ability 2",
  price: 69.99,
  description: "Description for Zord 4",
  quantity: 5
)

zord4.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord4.jpg')),
filename: 'zord4.jpg')

zord5 = Zord.create!(
  name: "Limited Edition1",
  theme: "Theme 1",
  material: "Material 2",
  capacity: 15,
  ability: "Ability 2",
  price: 170,
  description: "Description for Limited Edition",
  quantity: 1,
  limited: true
)

zord5.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord2.jpeg')),
filename: 'zord2.jpeg')

zord6 = Zord.create!(
  name: "Limited Edition2",
  theme: "Theme 1",
  material: "Material 2",
  capacity: 15,
  ability: "Ability 2",
  price: 170,
  description: "Description for Limited Edition",
  quantity: 1,
  limited: true
)

zord6.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord2.jpeg')),
filename: 'zord4.jpg')

bid1 = Bid.create!(
  zord: zord5,
  start_date: '2024-04-17',
  end_date: '2024-04-20',
  base_price: 170
)

bid2 = Bid.create!(
  zord: zord6,
  start_date: '2024-04-17',
  end_date: '2024-04-20',
  base_price: 170
)

Request.create!(
  material:  'Vibranium',
  theme: 'Marvel',
  ability: 'Elemental Powers',
  capacity:  5,
  user: user1
)

Request.create!(
  material:  'Kryptonite',
  theme: 'Bahubali',
  ability: 'Invisibility',
  capacity:  20,
  user: user1
)

Request.create!(
  material:  'Platinum',
  theme: 'Avatar',
  ability: 'Teleportation',
  capacity:  1,
  user: user1
)

user_registration1 = UserRegistration.create!(
  user: user1,
  bid: bid1,
  bid_value: 180
)

user_registration2 = UserRegistration.create!(
  user: user2,
  bid: bid1,
  bid_value: 190
)
