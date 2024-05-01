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
#  user_id     :bigint
#
# Indexes
#
#  index_payments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Payment < ApplicationRecord
  validates :card_type, presence: true
  validates :card_number, presence: true, numericality: { only_integer: true }
  validates :expiry_date, presence: true

  belongs_to :user
  has_many :orders
end
