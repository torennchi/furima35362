require 'rails_helper'
RSpec.context BuyerRecord, type: :model do
  before do
    @buyer_record = FactoryBot.build(:buyer_record)
  end
  context '商品購入がうまくいく時' do
    it '全ての値が正しく入力されていれば購入できること' do
      expect(@buyer_record).to be_valid
    end
  end
  context '商品購入がうまくいかない時' do
    it 'post_codeが空だと購入できない' do
      @buyer_record.post_code = nil
      @buyer_record.valid?
      expect(@buyer_record.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeにハイフンがないと購入できない' do
      @buyer_record.post_code = "1234567"
      @buyer_record.valid?
      expect(@buyer_record.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'area_idが未選択だと購入できない' do
      @buyer_record.area_id = 0
      @buyer_record.valid?
      expect(@buyer_record.errors.full_messages).to include("Area Select")
    end
    it 'municipalitiesが空だと購入できない' do
      @buyer_record.municipalities = nil
      @buyer_record.valid?
      expect(@buyer_record.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'addressが空だと購入できない' do
      @buyer_record.address = nil
      @buyer_record.valid?
      expect(@buyer_record.errors.full_messages).to include("Address number can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @buyer_record.phone_number = nil
      @buyer_record.valid?
      expect(@buyer_record.errors.full_messages).to include("PhoneNumber can't be blank")
    end
    it 'phone_numberが12桁以上では購入できない' do
      @buyer_record.phone_number = "090123456789"
      @buyer_record.valid?
      expect(@buyer_record.errors.full_messages).to include("") 
    end
  end
end
