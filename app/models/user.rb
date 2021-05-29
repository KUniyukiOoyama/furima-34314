class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, presence: true ,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname, presence: true
  
  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
      validates :last_name
      validates :first_name
    end

    with_options  format: { with: /\A[ァ-ヶー－]+\z/ }do
    validates :last_name_kana
    validates :first_name_kana
    end
 end
 
  validates :birthday, presence: true
  has_many :items



end