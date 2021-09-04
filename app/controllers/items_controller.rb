class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show,:edit,:update,:new,:create]
  before_action :item_confirmation, only: :update
  before_action :set_item, only: [:show, :update,:edit]

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
      redirect_to root_path
    else
      render :edit
    end
  end


  # def destroy
  #   if @item.destroy
  #     redirect_to root_path
  #   else
  #     render :show
  #   end
  # end

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
  redirect_to root_path unless current_user == items_url
 end
end




