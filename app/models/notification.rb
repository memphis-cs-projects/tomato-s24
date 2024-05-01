# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  message    :string
#  status     :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  request_id :bigint
#  user_id    :bigint
#  zord_id    :bigint
#
# Indexes
#
#  index_notifications_on_request_id  (request_id)
#  index_notifications_on_user_id     (user_id)
#  index_notifications_on_zord_id     (zord_id)
#
# Foreign Keys
#
#  fk_rails_...  (request_id => requests.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (zord_id => zords.id)
#
class Notification < ApplicationRecord

  #attribute :status, :string, default: 'Approved'
  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: 'user_id',
    inverse_of: :notifications
  )
  belongs_to :request
  belongs_to :zord
end
