# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint           not null
#  payment_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_orders_on_address_id  (address_id)
#  index_orders_on_payment_id  (payment_id)
#  index_orders_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#  fk_rails_...  (payment_id => payments.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
