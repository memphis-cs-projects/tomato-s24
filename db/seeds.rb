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
  name: "Thunder Striker",
  theme: "Thunderstorms",
  material: "Titanium Alloy",
  capacity: 5,
  ability: "Lightning Strike",
  price: 50,
  description: "A mighty MegaZord capable of summoning thunder and delivering devastating lightning strikes to its enemies.",
  quantity: 15
)

zord1.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord1.jpeg')),
filename: 'zord1.jpeg')

zord2 = Zord.create!(
  name: "Cosmic Guardian",
  theme: "Celestial Guardians",
  material: "Cosmic Energy Crystals",
  capacity: 8,
  ability: "Cosmic Shield",
  price: 80,
  description: "An otherworldly MegaZord that safeguards the universe with its impenetrable cosmic shield, protecting all that is good from cosmic threats.",
  quantity: 10
)

zord2.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord2.jpeg')),
filename: 'zord2.jpeg')

zord3 = Zord.create!(
  name: "Shadow Blade",
  theme: "Stealth Operations",
  material: "Shadowsteel",
  capacity: 2,
  ability: "Shadow Cloak",
  price: 30,
  description: "A sleek and stealthy MegaZord that moves through the shadows, striking swiftly with its razor-sharp blades to vanquish darkness wherever it lurks.",
  quantity: 15
)

zord3.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord3.jpg')),
filename: 'zord3.jpg')

zord4 = Zord.create!(
  name: "Phoenix Fury",
  theme: "Mythical Firebirds",
  material: "Phoenix Feathers",
  capacity: 15,
  ability: "Phoenix Rebirth",
  price: 70,
  description: "A fiery MegaZord embodying the legendary phoenix, capable of rising from its ashes and unleashing blazing fury upon its adversaries.",
  quantity: 5
)

zord4.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord4.jpg')),
filename: 'zord4.jpg')

zord5 = Zord.create!(
  name: "Galactic Goliath",
  theme: "Intergalactic Titans",
  material: "Cosmic Energy Crystals",
  capacity: 15,
  ability: "Galactic Slam",
  price: 170,
  description: "A colossal MegaZord of unparalleled might, traversing the galaxies and delivering earth-shaking slams that shake the very fabric of the cosmos.",
  quantity: 1,
  limited: true
)

zord5.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord2.jpeg')),
filename: 'zord2.jpeg')

zord6 = Zord.create!(
  name: "Nebula Nova",
  theme: "Cosmic Nebulae",
  material: " Nebula Essence",
  capacity: 15,
  ability: "Nebula Burst",
  price: 300,
  description: "A magnificent MegaZord hailing from the depths of space, harnessing the power of cosmic nebulae to create dazzling bursts of energy that dazzle and overwhelm its foes.",
  quantity: 1,
  limited: true
)

zord6.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord2.jpeg')),
filename: 'zord4.jpg')

bid1 = Bid.create!(
  zord: zord5,
  start_date: '2024-04-17',
  end_date: '2024-04-24',
  base_price: 170
)

bid2 = Bid.create!(
  zord: zord6,
  start_date: '2024-04-25',
  end_date: '2024-04-30',
  base_price: 300
)

request1= Request.create!(
  material:  'Vibranium',
  theme: 'Marvel',
  ability: 'Elemental Powers',
  capacity:  5,
  status: 'Pending',
  user: user1
)

request2 = Request.create!(
  material:  'Kryptonite',
  theme: 'Bahubali',
  ability: 'Invisibility',
  capacity:  20,
  status: 'Pending',
  user: user2
)

request3 =Request.create!(
  material:  'Platinum',
  theme: 'Avatar',
  ability: 'Teleportation',
  capacity:  1,
  status: 'Pending',
  user: user1
)
ser_registration1 = UserRegistration.create!(
  user: user1,
  bid: bid1,
  bid_value: 180
)

user_registration2 = UserRegistration.create!(
  user: user2,
  bid: bid1,
  bid_value: 190
)

Notification.create!(
  subject: 'Message from Vendor',
  message: 'Welcome Message',
  request: request2,
  user: user2,
  zord: zord5
)
