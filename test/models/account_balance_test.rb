# == Schema Information
#
# Table name: account_balances
#
#  id         :bigint           not null, primary key
#  balance    :decimal(10, 2)   default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_account_balances_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class AccountBalanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
