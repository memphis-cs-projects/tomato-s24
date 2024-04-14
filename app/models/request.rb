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
class Request < ApplicationRecord
  validates :material, presence: true
  MATERIAL_OPTIONS = [['select','select'],['Platinum', 'Platinum'], ['Kryptonite', 'Kryptonite'], ['Vibranium', 'Vibranium']]
  validates :ability, presence: true
  ABILITY_OPTIONS = [['Elemental Powers', 'Elemental Powers'], ['Invisibility', 'Invisibility'], ['Teleportation', 'Teleportation']]
  validates :theme, presence: true
  THEME_OPTIONS = [['select','select'],['Marvel', 'Marvel'], ['Bahubali', 'Bahubali'], ['Avatar', 'Avatar']]
  validates :capacity, presence: true
  CAPACITY_OPTIONS = [['1','1'],['5','5'],['20','20']]

  validate :unique_combination, on: :create
  validate :unique_combination, on: :update

  private

  def unique_combination
    existing_request = Request.find_by(material: material, theme: theme, ability: ability, capacity: capacity)
    errors.add(:base, 'This combination Request already exists') if existing_request
  end
end
