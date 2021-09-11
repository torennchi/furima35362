require 'rails_helper'
RSpec.context BuyerRecordAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @buyer_record_address = FactoryBot.build(:buyer_record_address,user_id: user.id,item_id: item.id)
    sleep 0.1 
  end
  context '商品購入がうまくいく時' do
    it '全ての値が正しく入力されていれば購入できること' do
      expect(@buyer_record_address).to be_valid
    end
  end
context '商品購入がうまくいかない時' do
    it 'post_codeが空だと購入できない' do
      @buyer_record_address.postal_code = nil
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'post_codeにハイフンがないと購入できない' do
      @buyer_record_address.postal_code = "1234567"
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'area_idが未選択だと購入できない' do
      @buyer_record_address.area_id = 0
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("Area can't be blank")
    end
    it 'municipalitiesが空だと購入できない' do
      @buyer_record_address.municipalities = nil
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'addressが空だと購入できない' do
      @buyer_record_address.address = nil
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @buyer_record_address.phone_number = nil
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが12桁以上では購入できない' do
      @buyer_record_address.phone_number = "090123456789000"
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("Phone number is invalid. Input half-width characters.") 
    end
  end
end

