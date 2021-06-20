class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end
end
 

private
def order_params
  params.require(:order_address).permit(:prefecture_id,:city,:house_number,:building_name,:post_number,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
end
def pay_item
  Payjp.api_key = "sk_test_b7da9a804c45eca50788ab8c"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price ,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
end