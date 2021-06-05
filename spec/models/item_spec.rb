require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context'出品商品が登録できる'do

      it 'title,description,price,image,shipping_id,status_id,category_id,lead_time_id,prefecture_idがあれば登録できる' do
        expect(@item).to be_valid
      end

    end
    
    context'出品商品が登録できない'do
      it 'titleが空の時登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空の時登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'imageが空の時登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが空の時登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300より低い時登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9999999より高い時登録できない' do
        @item.price = 10000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数字じゃない時登録できない' do
        @item.price = '８００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが整数じゃない時登録できない' do
        @item.price = '520.5'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end
      it 'priceが半角英語では登録できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英数字混合では登録できない' do
        @item.price = 'ac506'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end


      it 'shipping_idが1（ーが選択されている）の時登録できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end
      it 'status_idが1（ーが選択されている）の時登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      
      end
      it 'category_idが1（ーが選択されている）の時登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      
      end
      it 'lead_time_id（ーが選択されている）の時登録できない' do
        @item.lead_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Lead time must be other than 1")
     
      end
      it 'prefecture_id（ーが選択されている）の時登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
     
      end

    end

  
  end
end
