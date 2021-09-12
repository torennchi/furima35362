class BuyerRecordController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!,only: :index
  before_action :item_confirmation, only: :create
  before_action :buyer_record_url, only: [:index, :create]



  def index
    @buyer_record_address = BuyerRecordAddress.new
  end

  def create
    @buyer_record_address = BuyerRecordAddress.new(params_permit)
    if @buyer_record_address.valid?
      pay_item
      @buyer_record_address.save
      redirect_to root_path 
    else
      render :index
    end
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  private

  def params_permit
    params.require(:buyer_record_address).permit(:phone_number, :postal_code, :area_id, :municipalities, :address, :building_name).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params_permit[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def item_confirmation
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def buyer_record_url
    if @item.user_id == current_user.id || @item.buyer_record != nil
      redirect_to root_path
    end
  end
end
