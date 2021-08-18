class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email                 , presence: true
  validates :encrypted_password    , presence: true
  validates :password_confirmation , presence: true
  validates :nickname              , presence: true
  validates :birthday              , presence: true
  validates :surname               , presence: true
  validates :name                  , presence: true
  validates :kana_surname          , presence: true
  validates :kana_name             , presence: true

  has_many :items
  has_many :buyer_records
end
