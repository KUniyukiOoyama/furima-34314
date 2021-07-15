require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context'新規ユーザー登録ができる時'do
      it 'nickname,email,password,名前、名前（カナ）生年月日があれば登録できる' do
        expect(@user).to be_valid
      end

      it 'first_nameがひらがなであれば登録できる' do
        @user.first_name = 'ああああ'
        expect(@user).to be_valid
      end
      it 'first_nameがカタカナであれば登録できる' do
        @user.first_name = 'アアア'
        expect(@user).to be_valid
      end
      it 'first_nameが漢字であれば登録できる' do
        @user.first_name = '嗚呼'
        expect(@user).to be_valid
      end

      it 'last_nameがひらがなであれば登録できる' do
        @user.last_name = 'あああ'
        expect(@user).to be_valid
      end
      it 'last_nameがカタカナであれば登録できる' do
        @user.last_name = 'アアアア'
        expect(@user).to be_valid
      end
      it 'last_nameが漢字であれば登録できる' do
        @user.last_name = '嗚呼'
        expect(@user).to be_valid
      end

    end
    
    context'新規ユーザー登録ができない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '同じemailでは登録できない' do
        user1 = FactoryBot.create(:user)
        @user.email = user1.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it 'emailに＠がないとでは登録できない' do
        @user.email = 'ksg-ooyama1988yahoo.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
          it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角) 苗字を入力してください")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角) 名前を入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角) 苗字を入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角) 名前を入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが6文字以下では登録できない' do
        @user.password = '11k11'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordがアルファベットのみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが全角では登録できない' do
        @user.password = '５５５５ｋｙｔ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end


      it 'first_nameが漢字・平仮名・カタカナ以外では登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角) 苗字は不正な値です")
      end
      it 'first_name_kanaが全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角) 苗字は不正な値です")
      end
      it 'last_nameが漢字・平仮名・カタカナ以外では登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角) 名前は不正な値です")
      end
      it 'last_name_kanaが全角カタカナ以外では登録できない' do
        @user.last_name_kana = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角) 名前は不正な値です")
      end





    end
  end
end
