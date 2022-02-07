class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :bookings
  has_many :churches

  validates :email, format: { with: /\A.*@.*\..*\z/ }
  validates :email, uniqueness: true, on: :create

  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
/x

validates :password,
  presence: true,
  length: { in: Devise.password_length },
  format: { with: PASSWORD_FORMAT },
  confirmation: true,
  on: :create

validates :password,
  allow_nil: true,
  length: { in: Devise.password_length },
  format: { with: PASSWORD_FORMAT },
  confirmation: true,
  on: :update


end
