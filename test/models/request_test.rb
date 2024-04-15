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
#
require "test_helper"

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
