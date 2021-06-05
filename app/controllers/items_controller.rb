class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
   end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  def new
    @item = Item.new
    @items = Item.order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end



  private

  def item_params
    params.require(:item).permit(:image,:title,:description,:category_id,:status_id,:shipping_id,:prefecture_id,:lead_time_id,:price).merge(user_id: current_user.id)
  end

end
