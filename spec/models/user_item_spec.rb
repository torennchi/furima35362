# require 'rails_helper'
#  RSpec.describe UserItem, type: :model do
#   before do
#     @user_item = FactoryBot.build(:user_item)
#   end

#    describe '商品の情報の保存' do
#      it 'すべての値が正しく入力されていれば保存できること' do
#         expect(@user_item).to be_valid
#      end
#      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
#         visit root_path
#         expect(current_user_path).to eq(new_item_path)
#      end
#      it 'ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること' do
#         visit root_path
#         expect(current_path).to eq(new_user_session_path)
#      end
#      it'添付する画像を定義する' do
#         image_path = Rails.root.join('public/test_image.png')
#      end
#      it '画像選択フォームに画像を添付する' do
#         attach_file('item[image]', image_path, make_visible: true)
#      end
#      it '商品名が必須であること' do
#         @user_item.product_name = ""
#         @user_item.valid?
#         expect(@user_item.errors.full_messages).to include("UserProductName can't be blank")
#      end
#      it '商品の説明が必須であること' do
#         @user_item.text = ""
#         @user_item.valid?
#         expect(@user_item.errors.full_messages).to include("Text can't be blank")
#      end
#      it 'カテゴリーの情報が必須であること' do
#         @user_item.category = ""
#         @user_item.valid?
#         expect(@user_item.errors.full_messages).to include("Category can't be blank")
#      end
#      it '商品の状態についての情報が必須であること' do
#         @user_item.status = ""
#         @user_item.valid?
#         expect(@user_item.errors.full_messages).to include("Status can't be blank")
#      end
#      it '配送料の負担についての情報が必須であること' do
#         @user_item.cost = ""
#         @user_item.valid?
#         expect(@user_item.errors.full_messages).to include("Cost can't be blank")
#      end
#      it '発送元の地域についての情報が必須であること' do
#         @user_item.area = ""
#         @user_item.valid?
#         expect(@user_item.errors.full_messages).to include("Area can't be blank")
#      end
#      it '発送までの日数についての情報が必須であること' do
#         @user_item.shipping_day = ""
#         @user_item.valid?
#         expect(@user_item.errors.full_messages).to include("ShippingDay can't be blank")
#      end
#      it '販売価格についての情報が必須であること' do
#         @user_item.price = ""
#         @user_item.valid?
#         expect(@user_item.errors.full_messages).to include("Price can't be blank")
#      end
#      it 'priceが300円未満では保存できないこと' do
#         @user_item.price = 0
#         @user_item.valid?
#         expect(@user_item.errors.full_messages).to include("Price is out of setting range")
#      end
#      it 'priceが1,000,000円を超過すると保存できないこと' do
#         @user_item.price = 1000001
#         @user_item.valid?
#         expect(@user_item.errors.full_messages).to include("Price is out of setting range")
#      end
#      it '販売価格は半角数字のみ保存可能であること' do
#         @user_item.price = '２０００'
#         @user_item.valid?
#         expect(@user_item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
#      end
#      it '入力された販売価格によって、販売手数料や販売利益の表示が変わること' do
#      end
#      it '必要な情報を適切に入力すると、商品情報がデータベースに保存されること' do
#     end
#   end
# end

