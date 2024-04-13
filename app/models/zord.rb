# == Schema Information
#
# Table name: zords
#
#  id          :bigint           not null, primary key
#  ability     :string
#  capacity    :integer
#  description :text
#  material    :string
#  name        :string
#  price       :decimal(, )
#  quantity    :integer
#  theme       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Zord < ApplicationRecord


  has_one_attached :figure_image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :figure_image, presence: true, allow_blank: true

end