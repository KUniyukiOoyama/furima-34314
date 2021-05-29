class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, presence: true ,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :last_name, presence: true, format: { with: /[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :first_name_kana, presence: true, format: { with: /[ァ-ヶ一]/ }
  validates :last_name_kana, presence: true, format: { with: /[ァ-ヶ一]/ }
  validates :birthday, presence: true
  has_many :items



end
