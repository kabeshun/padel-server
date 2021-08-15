class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  extend Enumerize
  enumerize :gender, in: %i[
    male
    female
    other
  ]
  has_many :favorites
  has_many :facilities, through: :favorites
end