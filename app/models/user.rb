class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :email, presence: true

  has_many :messages, dependent: :destroy
  has_many :chatrooms
  has_one :dog, dependent: :destroy
end
