class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :item_confirmation, only: [:edit, :destroy, :update]
  before_action :edit_cancel, only: :edit

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
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
      redirect_to item_path(@item.id)
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
  end

  private

 def item_params
  params.require(:item).permit(:area_id, :category_id, :cost_id, :shipping_day_id, :status_id,:product_name, :text, :price, :image).merge(user_id: current_user.id)
 end

 def set_item
  @item = Item.find(params[:id])
end

 def item_confirmation
  @item = Item.find(params[:id])
  redirect_to root_path unless current_user.id == @item.user_id
 end

 def edit_cancel
  @item = Item.find(params[:id])
  redirect_to root_path if @item.buyer_record.present?
end
end




