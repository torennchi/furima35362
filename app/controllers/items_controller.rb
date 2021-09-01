class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
      render "new"    # バリデーションに弾かれた時
    end
  end

  private

 def item_params
  params.require(:item).permit(:area_id, :category_id, :cost_id, :shipping_day_id, :status_id,:product_name, :text, :price, :image).merge(user_id: current_user.id)
 end
end




