# == Schema Information
#
# Table name: resales
#
#  id         :bigint           not null, primary key
#  condition  :string
#  new_price  :decimal(, )
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  zord_id    :bigint           not null
#
# Indexes
#
#  index_resales_on_user_id  (user_id)
#  index_resales_on_zord_id  (zord_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (zord_id => zords.id)
#
class Resale < ApplicationRecord
  belongs_to :zord
  belongs_to :user
end
