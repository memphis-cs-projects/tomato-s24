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
  validates :figure_image, presence: false, allow_blank: true


  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "material", "theme", "ability" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
