class BuyerRecordController < ApplicationController
  before_action :set_item, only: [:index, :create]


  def index
    @buyer_record_address = BuyerRecordAddress.new
  end

  def create
    @buyer_record_address = BuyerRecordAddress.new(params_permit)
    if @buyer_record_address.valid?
      @buyer_record_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def params_permit
    params.require(:buyer_record_address).permit(:phone_number, :postal_code, :area_id, :municipalities, :address, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
