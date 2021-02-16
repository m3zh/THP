class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  validates :title,
    presence: true,
    length: { minimum: 2,
    too_long: "Title cannot be longer than 14 characters"}
  validates :content,
    presence: true,
    length: { minimum: 5,
    too_short: "Text cannot be shorter than 50 characters"}
end
