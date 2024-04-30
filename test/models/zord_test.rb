# == Schema Information
#
# Table name: zords
#
#  id          :bigint           not null, primary key
#  ability     :string
#  avg_rating  :decimal(, )
#  capacity    :integer
#  description :text
#  limited     :boolean          default(FALSE)
#  material    :string
#  name        :string
#  price       :decimal(, )
#  quantity    :integer
#  theme       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class ZordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
