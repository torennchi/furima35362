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
    it '建物名がない場合も登録出来ること' do
      @buyer_record_address.building_name = nil
      expect(@buyer_record_address).to be_valid
    end
  end
context '商品購入がうまくいかない時' do
    it 'post_codeが空だと購入できない' do
      @buyer_record_address.postal_code = nil
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'post_codeにハイフンがないと購入できない' do
      @buyer_record_address.postal_code = "1234567"
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("郵便番号はハイフン（-）を含めて入力してください")
    end
    it 'area_idが未選択だと購入できない' do
      @buyer_record_address.area_id = 0
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("都道府県を入力してください")
    end
    it 'municipalitiesが空だと購入できない' do
      @buyer_record_address.municipalities = nil
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("市区町村を入力してください")
    end
    it 'addressが空だと購入できない' do
      @buyer_record_address.address = nil
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("番地を入力してください")
    end
    it 'phone_numberが空だと購入できない' do
      @buyer_record_address.phone_number = nil
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'phone_numberが12桁以上では購入できない' do
      @buyer_record_address.phone_number = "090123456789000"
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("電話番号は半角文字を入力してください") 
    end
    it 'phone_numberが半角数字以外が含まれる場合は登録できない' do
      @buyer_record_address.phone_number = "0901234aaaa"
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("電話番号は半角文字を入力してください") 
    end
      it "tokenが空では登録できないこと" do
      @buyer_record_address.token = nil
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
    it "user_idが空では登録できないこと" do
      @buyer_record_address.user_id = nil
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("Userを入力してください")
    end
    it "item_idが空では登録できないこと" do
      @buyer_record_address.item_id = nil
      @buyer_record_address.valid?
      expect(@buyer_record_address.errors.full_messages).to include("Itemを入力してください")
    end
  end
end

