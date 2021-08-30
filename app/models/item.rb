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

  validates :product_name, :text, presence: true
  validates :area_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :cost_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :price,  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 1000000, message: "is out of setting range"}

end
