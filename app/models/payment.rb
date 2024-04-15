# == Schema Information
#
# Table name: payments
#
#  id          :bigint           not null, primary key
#  card_number :integer
#  card_type   :string
#  expiry_date :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Payment < ApplicationRecord
  has_many :orders
end
