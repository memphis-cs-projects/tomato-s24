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
  email: 'vendor@email.com',
  password: 'password',
  vendor: true
)

#Zords
zord1 = Zord.create!(
  name: "Thunder Striker",
  theme: "Thunderstorms",
  material: "Titanium Alloy",
  capacity: 5,
  ability: "Lightning Strike",
  price: 50,
  description: "A mighty MegaZord capable of summoning thunder and delivering devastating lightning strikes to its enemies.",
  quantity: 15,
  avg_rating: 4
)

zord1.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord1.jpg')),
filename: 'zord1.jpg')

zord2 = Zord.create!(
  name: "Cosmic Guardian",
  theme: "Celestial Guardians",
  material: "Cosmic Energy Crystals",
  capacity: 8,
  ability: "Cosmic Shield",
  price: 80,
  description: "An otherworldly MegaZord that safeguards the universe with its impenetrable cosmic shield, protecting all that is good from cosmic threats.",
  quantity: 10,
  avg_rating: 3.5
)

zord2.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord2.jpg')),
filename: 'zord2.jpg')

zord3 = Zord.create!(
  name: "Shadow Blade",
  theme: "Stealth Operations",
  material: "Shadowsteel",
  capacity: 2,
  ability: "Shadow Cloak",
  price: 30,
  description: "A sleek and stealthy MegaZord that moves through the shadows, striking swiftly with its razor-sharp blades to vanquish darkness wherever it lurks.",
  quantity: 15,
  avg_rating: 5
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
  quantity: 5,
  avg_rating: 4
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
  avg_rating: 5,
  limited: true
)

zord5.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord5.jpg')),
filename: 'zord5.jpg')

zord6 = Zord.create!(
  name: "Nebula Nova",
  theme: "Cosmic Nebulae",
  material: " Nebula Essence",
  capacity: 15,
  ability: "Nebula Burst",
  price: 300,
  description: "A magnificent MegaZord hailing from the depths of space, harnessing the power of cosmic nebulae to create dazzling bursts of energy that dazzle and overwhelm its foes.",
  quantity: 1,
  avg_rating: 4.8,
  limited: true
)

zord6.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord6.jpg')),
filename: 'zord6.jpg')

zord7 = Zord.create!(
  name: "Frostbite Fury",
  theme: "Arctic Tundra",
  material: "Icesteel",
  capacity: 12,
  ability: "Frostbite Blizzard",
  price: 280,
  description: "The Frostbite Fury Zord reigns supreme in the frozen wastelands, wielding the power of ice and snow to freeze its enemies solid. With its chilling presence, it strikes fear into the hearts of all who oppose it.",
  quantity: 1,
  avg_rating: 4.6,
  limited: true
)

zord7.figure_image.attach(io: File.open(Rails.root.join('app/assets/images/zord7.jpg')),
filename: 'zord7.jpg')

#Bids
bid1 = Bid.create!(
  zord: zord5,
  start_date: '2024-04-17',
  end_date: '2024-04-27',
  base_price: 170
)

bid2 = Bid.create!(
  zord: zord6,
  start_date: '2024-04-27',
  end_date: '2024-04-30',
  base_price: 300
)

bid3 = Bid.create!(
  zord: zord7,
  start_date: '2024-04-12',
  end_date: '2024-04-18',
  base_price: 500
)

#Requests
request0= Request.create!(
  material:  'Winner Notification',
  theme: 'Winner',
  ability: 'Winner Powers',
  capacity:  5,
  status: 'Winner',
  user: user3
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

#User Registrations
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

user_registration3 = UserRegistration.create!(
  user: user1,
  bid: bid2,
  bid_value: 1800
)

user_registration4 = UserRegistration.create!(
  user: user2,
  bid: bid2,
  bid_value: 1900
)

user_registration5 = UserRegistration.create!(
  user: user1,
  bid: bid3,
  bid_value: 2000
)

user_registration6 = UserRegistration.create!(
  user: user2,
  bid: bid3,
  bid_value: 1900
)

#Notifications
notification_1 = Notification.create!(
  subject: 'Message from Vendor',
  message: 'Welcome Message',
  request: request2,
  user: user1,
  zord: zord5
)

address_1 = Address.create!(
  street_address: '3655 Southern Ave',
  city: 'MEM',
  state: 'TN',
  zipcode: '38111',
  user: user1
)

payment_1 = Payment.create!(
  card_type: 'Credit Card',
  card_number: '1234567890',
  expiry_date: Date.new(2024, 1, 31),
  user: user1
)

order1 = Order.create!(
  user: user1,
  address: address_1,
  payment: payment_1,
)

order_item_1 = OrderItem.create!(
  order: order1,
  zord: zord2,
  quantity: 3
)

Review.create!(
  order_item: order_item_1,
  user: user1,
  zord: zord2,
  rating: 4
)
