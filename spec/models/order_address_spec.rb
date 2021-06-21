require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
      sleep(1)
    end

    context'商品が購入できる時'do
      it 'token,post_number,prefecture_id,post_number,phone_number,city,house_numberがあれば登録できる' do
       expect(@order_address).to be_valid
      end
      it 'building_nameは空でも登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
       end
    end
    
    context'商品が購入できない時' do
      it 'tokenが空の時登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'prefecture_idが空の時登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'post_numberが空の時登録できない' do
        @order_address.post_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'cityが空の時登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空の時登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空の時登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'post_numberは-がないと登録できない' do
        @order_address.post_number = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number is invalid")
      end
      it 'post_numberは半角英数字混合では登録できない' do
        @order_address.post_number = '123-45aa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number is invalid")
      end
      it 'phone_numberに英数混合があると登録ができない' do
        @order_address.phone_number = '0901234567a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが11桁以上の数値だと登録ができない' do
        @order_address.phone_number = '090111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'item_idが空の時登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空の時登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
    end

  end
end