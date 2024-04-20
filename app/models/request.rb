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
class Request < ApplicationRecord

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: 'user_id',
    inverse_of: :requests
  )

  has_one(
  :notification,
  dependent: :destroy)
  attribute :status, :string, default: 'Pending'
  validates :material, presence: true
  MATERIAL_OPTIONS = [['select','select'],['Platinum', 'Platinum'], ['Kryptonite', 'Kryptonite'], ['Vibranium', 'Vibranium'], ['Silver', 'Silver'], ['Gold', 'Gold']]
  validates :ability, presence: true
  ABILITY_OPTIONS = [['Elemental Powers', 'Elemental Powers'], ['Invisibility', 'Invisibility'], ['Teleportation', 'Teleportation'],['Lightning', 'Lightning'],['Ironfist', 'Ironfist']]
  validates :theme, presence: true
  THEME_OPTIONS = [['select','select'],['Marvel', 'Marvel'], ['Bahubali', 'Bahubali'], ['Avatar', 'Avatar'],['DC','DC']]
  validates :capacity, presence: true
  CAPACITY_OPTIONS = [['1','1'],['5','5'],['10','10'],['15','15'],['20','20']]


  validate :unique_combination, on: [:create, :update]
  private

  def unique_combination
    existing_request = Request.find_by(material: material, theme: theme, ability: ability, capacity: capacity, status: status)
    errors.add(:base, 'This combination Request already exists') if existing_request
  end
end
