class Cost < ActiveHash::Base
  self.data = [
    { id: 0, date: '---' },
    { id: 1, date: '着払い（購入者負担）' },
    { id: 2, date: '送料込み（出品者負担）' },
  ]

  include ActiveHash::Associations
  has_many :items
end