class User < ApplicationRecord
  after_commit :welcome_send, only: [:create]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :cart_items, through: :cart, dependent: :destroy


  def welcome_send
    UserMailer.welcome_email(self).deliver
  end

end
