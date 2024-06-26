# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  vendor                 :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord

  has_one :cart
  has_many :orders
  has_many :addresses
  has_many :payments
  has_many(
    :requests,
    class_name: 'Request',
    foreign_key: 'user_id',
    inverse_of: :user,
    dependent: :destroy
  )
  has_many :user_registrations
  has_many :bids, through: :user_registrations, source: :bid
  has_many :resales, dependent: :destroy
  has_one :account_balance

  has_many(
    :notifications,
    class_name: 'Notification',
    foreign_key: 'user_id',
    inverse_of: :user,
    dependent: :destroy
  )

  has_many(
    :reviews,
    class_name: 'Review',
    foreign_key: 'user_id',
    inverse_of: :user,
    dependent: :destroy
  )
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
