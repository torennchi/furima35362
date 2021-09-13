class BuyerRecordAddress

  include ActiveModel::Model
  attr_accessor  :phone_number, :postal_code, :area_id, :municipalities, :address, :building_name, :item_id, :user_id, :token


  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフン（-）を含めて入力してください",allow_blank: true}
    with_options  numericality: { other_than: 0 , message: "を入力してください",allow_blank: true}do
      validates  :area_id
    end
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{,11}\z/, message: "は半角文字を入力してください",allow_blank: true}
    validates :user_id
    validates :item_id
  end


  def save
    buyer_record = BuyerRecord.create(user_id: user_id, item_id: item_id)
    Address.create(phone_number: phone_number,postal_code: postal_code,area_id: area_id,municipalities: municipalities,address: address,building_name: building_name,buyer_record_id: buyer_record.id)
  end
end
  