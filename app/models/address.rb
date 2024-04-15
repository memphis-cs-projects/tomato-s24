# == Schema Information
#
# Table name: addresses
#
#  id             :bigint           not null, primary key
#  city           :string
#  state          :string
#  street_address :string
#  zipcode        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Address < ApplicationRecord
  validates :street_address, :city, :state, :zipcode, presence: true
  validates :zipcode, numericality: { only_integer: true }

  # Associations
  has_many :orders
end
