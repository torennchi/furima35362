class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         with_options presence: true do
          validates :password, format:{ with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角文字を入力してください",allow_blank: true}
          validates :surname, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）を入力してください",allow_blank: true}
          validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）を入力してください",allow_blank: true}
          validates :nickname
          validates :kana_surname, format: { with:/\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）を入力してください",allow_blank: true}
          validates :kana_name, format: { with:/\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）を入力してください",allow_blank: true}
          validates :birthday
          end

  has_many :items
  has_many :buyer_records
end
