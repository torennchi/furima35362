class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :cost
  belongs_to :shipping_day
  belongs_to :status
  belongs_to :area

  belongs_to :user

  has_one :buyer_record
  has_one_attached :image

  with_options presence: true do
    validates :product_name, :text, :image
      with_options  numericality: { other_than: 0 , message: "を入力してください",allow_blank: true}do
    validates  :area_id, :category_id, :cost_id, :shipping_day_id, :status_id
    end
      with_options  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は300円以上、9999999円以下を入力してください",allow_blank: true}do
    validates  :price
    end
  end
end
