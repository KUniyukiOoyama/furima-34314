class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :prefecture_id, :city, :building_name,:house_number , :post_number ,:phone_number, :user_id , :item_id

  validates :prefecture_id , numericality: { other_than: 1 } 


  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ } 
    validates :phone_number ,format: { with: /\A\d{9,11}\z/ }      
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々a-z\d]+\z/i} do
      validates :city
      validates :house_number
    end

    
  end


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(city: city, prefecture_id: prefecture_id, house_number: house_number, building_name: building_name, phone_number: phone_number, post_number: post_number,order_id: order.id)
  end

end