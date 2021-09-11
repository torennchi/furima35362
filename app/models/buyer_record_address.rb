class BuyerRecordAddress

  include ActiveModel::Model
  attr_accessor  :phone_number, :postal_code, :area_id, :municipalities, :address, :building_name, :item_id, :user_id, :token


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{,11}\z/, message: "is invalid. Input half-width characters."}
    validates :address
    validates :municipalities
    validates :user_id
    validates :item_id
    validates :token
    with_options  numericality: { other_than: 0 , message: "can't be blank"}do
      validates  :area_id
    end
  end


  def save
    buyer_record = BuyerRecord.create(user_id: user_id, item_id: item_id)
    Address.create(phone_number: phone_number,postal_code: postal_code,area_id: area_id,municipalities: municipalities,address: address,building_name: building_name,buyer_record_id: buyer_record.id)
  end
end
  