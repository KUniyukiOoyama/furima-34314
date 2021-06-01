class ItemsController < ApplicationController
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
end
