# class AddressesController < ApplicationController
#   before_action :set_item, only: [:index, :create]

#   def index
#     @user_address = BuyerRecordAddress.new
#   end
 
#   def create
#     @user_address = UserAddress.new(params_permit)

#     @user_address.save
#     redirect_to action: :index
#   end

#   private

#   def params_permit
#     params.require(:user_address).permit(:phone_number, :postal_code, :area_id, :municipalities, :address, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
#   end

#   def set_item
#     @item = Item.find(params[:item_id])
#   end
# end






