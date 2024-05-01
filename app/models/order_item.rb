# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint           not null
#  zord_id    :bigint           not null
#
# Indexes
#
#  index_order_items_on_order_id  (order_id)
#  index_order_items_on_zord_id   (zord_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (zord_id => zords.id)
#
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :zord
  has_many :reviews, dependent: :destroy
end
