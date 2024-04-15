# == Schema Information
#
# Table name: addresses
#
#  id             :bigint           not null, primary key
#  city           :string
#  state          :string
#  street_address :string
#  zipcode        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
