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
  end
end
