class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit, :show, :destroy, :update]

  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
   else
      redirect_to user_session_path(@item.id)
   end
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

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

 def item_params
  params.require(:item).permit(:area_id, :category_id, :cost_id, :shipping_day_id, :status_id,:product_name, :text, :price, :image).merge(user_id: current_user.id)
 end

 def set_item
  @item = Item.find(params[:id])
end
end




