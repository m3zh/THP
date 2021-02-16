class User < ApplicationRecord
  has_secure_password
  belongs_to :city, optional: true
  has_and_belongs_to_many :gossips, optional: true
  has_many :comments
  has_many :sent_msg, foreign_key: 'sender_id', class_name: "PrivateMsg"
  has_many :received_msg, foreign_key: 'recipient_id', class_name: "PrivateMsg"
  validates :password,
    presence: true,
    length: { minimum: 6, too_short: "Password cannot be shorter than 6 characters"}
end
