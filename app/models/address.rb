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
#  user_id        :bigint
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Address < ApplicationRecord
  validates :street_address, :city, :state, :zipcode, presence: true
  validates :zipcode, numericality: { only_integer: true }

  # Associations
  belongs_to :user
  has_many :orders
end
