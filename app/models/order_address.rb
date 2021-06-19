class OrderAddress
  include ActiveModel::Model
  attr_accessor :prefecture_id, :city, :building_name,:house_number , :post_number ,:phone_number, :user_id , :item_id

  validates :prefecture_id , numericality: { other_than: 1 } 


  with_options presence: true do
    validates :user_id
    validates :item_id
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々][a-z\d]+\z/ } do
      validates :city
      validates :house_number
    end
    with_options format: { with: /\A[a-z\d]+\z/i } do 
      validates :post_number
      validates :phone_number
    end
  end


  def save
    order = Oreder.create(item_id: item_id, user_id: user_id)
    Address.create(city: city, prefecture_id: prefecture_id, house_number: house_number, building_name: building_name, post_number: post_number, post_number: post_number,order_id: order.id)
  end





  

end