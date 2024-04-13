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
  MATERIAL_OPTIONS = [['Platinum', 'Platinum'], ['Kryptonite', 'Kryptonite'], ['Vibranium', 'Vibranium']]
  validates :ability, presence: true
  ABILITY_OPTIONS = [['Elemental Powers', 'Wlemental Powers'], ['Invisibility', 'Invisibility'], ['Teleportation', 'Teleportation']]
  validates :theme, presence: true
  validates :capacity, presence: true
end
