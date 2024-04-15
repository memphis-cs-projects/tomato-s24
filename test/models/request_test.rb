# == Schema Information
#
# Table name: requests
#
#  id          :bigint           not null, primary key
#  ability     :string
#  capacity    :integer
#  description :string
#  material    :string
#  messsage    :string
#  name        :string
#  price       :integer
#  status      :string
#  theme       :string
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_requests_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
