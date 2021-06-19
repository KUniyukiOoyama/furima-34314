class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
    else
      render :index
    end
  end
end
 

private
def order_params
  params.require(:order_address).permit(:prefecture_id,:city,:house_number,:building_name,:post_number,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
end
# def adress_params
#   params.permit(:prefecture_id,:city,:house_number,:building_name,:post_number,:phone_number).merge(user_id: current_user.id)
# end