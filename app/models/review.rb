# == Schema Information
#
# Table name: reviews
#
#  id             :bigint           not null, primary key
#  rating         :integer
#  review_message :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  order_item_id  :bigint
#  user_id        :bigint
#  zord_id        :bigint
#
# Indexes
#
#  index_reviews_on_order_item_id  (order_item_id)
#  index_reviews_on_user_id        (user_id)
#  index_reviews_on_zord_id        (zord_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_item_id => order_items.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (zord_id => zords.id)
#
class Review < ApplicationRecord

  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: 'user_id',
    inverse_of: :reviews
  )

  belongs_to(
    :order_item,
    class_name: 'OrderItem',
    foreign_key: 'order_item_id',
    inverse_of: :reviews
  )

  belongs_to(
    :zord,
    class_name: 'Zord',
    foreign_key: 'zord_id',
    inverse_of: :reviews
  )
end
