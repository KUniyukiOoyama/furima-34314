class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item_params , only:[:show,:edit,:update,:destroy]
  before_action :user_check , only:[:edit,:destroy]
  before_action :order_check, only:[:edit,:destroy]
  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def show
  end

  def edit

  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:title,:description,:category_id,:status_id,:shipping_id,:prefecture_id,:lead_time_id,:price).merge(user_id: current_user.id)
  end
  def set_item_params
    @item = Item.find(params[:id])
  end

  def user_check
    redirect_to root_path unless current_user == @item.user
  end
  def order_check
    redirect_to root_path if @item.order
  end


end
