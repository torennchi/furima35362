class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer_record
  has_one_attached :image
end
