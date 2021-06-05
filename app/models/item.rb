class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping
  belongs_to :status
  belongs_to :category
  belongs_to :lead_time
  belongs_to :prefecture


  with_options numericality: { other_than: 1 }  do
    validates :shipping_id
    validates :status_id
    validates :category_id
    validates :lead_time_id
    validates :prefecture_id
  end

  with_options presence: true do
    validates :title
    validates :description 
    validates :price, numericality: { only_integer: true , greater_than_or_equal_to:300 ,less_than_or_equal_to:9999999 },format: {with:/\A[0-9]+\z/}
    validates :image  
  end

end
