# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  message    :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  request_id :bigint
#  user_id    :bigint
#  zord_id    :bigint
#
# Indexes
#
#  index_notifications_on_request_id  (request_id)
#  index_notifications_on_user_id     (user_id)
#  index_notifications_on_zord_id     (zord_id)
#
# Foreign Keys
#
#  fk_rails_...  (request_id => requests.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (zord_id => zords.id)
#
require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
