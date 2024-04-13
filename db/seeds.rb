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

Request.create!(
  material:  'Vibranium',
  theme: 'Marvel',
  ability: 'Elemental Powers',
  capacity:  5
)

Request.create!(
  material:  'Kryptonite',
  theme: 'Bahubali',
  ability: 'Invisibility',
  capacity:  20
)

Request.create!(
  material:  'Platinum',
  theme: 'Avatar',
  ability: 'Teleportation',
  capacity:  1
)
