require 'rails_helper'
 RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

   describe '商品の情報の保存' do
     it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
     end
     it '商品名が必須であること' do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
     end
     it '商品の説明が必須であること' do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
     end
     it 'カテゴリーの情報が必須であること' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
     end
     it '商品の状態についての情報が必須であること' do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
     end
     it '配送料の負担についての情報が必須であること' do
        @item.cost_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
     end
     it '発送元の地域についての情報が必須であること' do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
     end
     it '発送までの日数についての情報が必須であること' do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
     end
     it '販売価格についての情報が必須であること' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
     end
     it 'priceが300円未満では保存できないこと' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
     end
     it 'priceが1,000,000円を超過すると保存できないこと' do
        @item.price = 1000001
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
     end
     it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
     end
  end
end