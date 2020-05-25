class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise    :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable

  # Validations
  validates :nickname, presence: true, uniqueness: true
  validates :email,    presence: true, uniqueness: true
  validates :gender,   presence: true

  # Associations
  has_many :targets
  has_many :matchs
  has_many :messages
end