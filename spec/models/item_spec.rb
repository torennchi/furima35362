require 'rails_helper'
 RSpec.context Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品の情報の保存ができる' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
  end
context '商品の情報の保存ができない' do
  it 'userが紐付いていないと保存できない' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('Userを入力してください')
  end
  it '画像が必須であること' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("画像を入力してください")
  end
    it '商品名が必須であること' do
      @item.product_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it '商品の説明が必須であること' do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("テキストを入力してください")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it '商品の状態についての情報が必須であること' do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.cost_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.shipping_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end
    it '発送元の地域についての情報が0の場合登録できないこと' do
      @item.area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end
    it 'カテゴリーの情報が0の場合登録できないこと' do
    @item.category_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it '商品の状態についての情報が0の場合登録できないこと' do
    @item.status_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end
    it '配送料の負担についての情報が0の場合登録できないこと' do
    @item.cost_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end
    it '発送までの日数についての情報が0の場合登録できないこと' do
    @item.shipping_day_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end
    it '販売価格についての情報が必須であること' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end
    it 'priceが300円未満では保存できないこと' do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は300円以上、9999999円以下を入力してください")
    end
    it 'priceが9,999,999円を超過すると保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は300円以上、9999999円以下を入力してください")
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は300円以上、9999999円以下を入力してください")
    end
    it '半角英数混合では登録できないこと' do
      @item.price = '12aaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は300円以上、9999999円以下を入力してください")
    end
    it '半角英語だけでは登録できないこと' do
    @item.price = 'aaaa'
    @item.valid?
    expect(@item.errors.full_messages).to include("価格は300円以上、9999999円以下を入力してください")
    end
  end
end