# == Schema Information
#
# Table name: user_registrations
#
#  id         :bigint           not null, primary key
#  bid_value  :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bid_id     :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_registrations_on_bid_id   (bid_id)
#  index_user_registrations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (bid_id => bids.id)
#  fk_rails_...  (user_id => users.id)
#
class UserRegistration < ApplicationRecord
  belongs_to :bid
  belongs_to :user
end
