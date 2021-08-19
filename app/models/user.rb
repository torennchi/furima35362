class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         with_options presence: true do
          validates :surname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
          validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
          validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
          validates :kana_surname, format: { with:/\A[ァ-ヶー－]+\z/, message: "is invalid."}
          validates :kana_name, format: { with:/\A[ァ-ヶー－]+\z/, message: "is invalid."}
          validates :birthday
          end

  # has_many :items
  # has_many :buyer_records
end
