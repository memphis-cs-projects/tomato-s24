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
#  used        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Zord < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :resales

  has_one(
  :notification,
  dependent: :destroy)
  has_many(
    :reviews,
    dependent: :destroy
  )

  has_one :bid, dependent:   :destroy

  has_one_attached :figure_image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :figure_image, presence: false, allow_blank: true
  validates :capacity, numericality: { greater_than: 0}

  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "material", "theme", "ability" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.available_materials
    pluck(:material).uniq
  end

  def self.available_themes
    pluck(:theme).uniq
  end

end
