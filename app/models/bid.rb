# == Schema Information
#
# Table name: bids
#
#  id         :bigint           not null, primary key
#  base_price :decimal(, )
#  end_date   :date
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  zord_id    :bigint           not null
#
# Indexes
#
#  index_bids_on_zord_id  (zord_id)
#
# Foreign Keys
#
#  fk_rails_...  (zord_id => zords.id)
#
class Bid < ApplicationRecord
  belongs_to :zord

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :base_price, presence: true
end
