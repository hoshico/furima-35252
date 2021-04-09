require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it "nicknameがあれば登録できること" do
        @user.nickname = 'リク太郎'
        expect(@user).to be_valid
      end
      it "emailがあれば登録できる" do
        @user.email = 'test@test.com'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'yasu11'
        @user.password_confirmation = 'yasu11'
        expect(@user).to be_valid
      end
      it 'passwordは半角英数混合であれば登録できること' do
        @user.password = "yasu22"
        @user.password_confirmation = 'yasu22'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致すれば登録できること' do
        @user.password = 'yasu0205'
        @user.password_confirmation = 'yasu0205'
        expect(@user).to be_valid
      end   
      it "last_nameがあれば登録できること" do
        @user.last_name = '山'
        expect(@user).to be_valid
      end  
      it "first_nameがあれば登録できること" do
        @user.first_name = '陸'
        expect(@user).to be_valid
      end
      it "last_name_kanaがあれば登録できること" do
        @user.last_name_kana = 'ヤマ'
        expect(@user).to be_valid
      end
      it "first_name_kanaがあれば登録できること" do
        @user.first_name_kana = 'リク'
        expect(@user).to be_valid
      end
      it 'last_nameが全角入力であれば登録できること' do
        @user.last_name = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'first_nameが全角入力であれば登録できること' do
        @user.first_name = 'リク'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角カタカナであれば登録できること' do
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カタカナであれば登録できること' do
        @user.first_name_kana = 'リク'
        expect(@user).to be_valid
      end
      it "birthdayがあれば登録できること" do
        @user.birthday = '1999-01-01'
        expect(@user).to be_valid
      end  
    end

    context '内容に問題がある場合' do
      it "nicknameがない場合は登録できないこと" do
        @user.nickname = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailがない場合は登録できないこと" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "passwordがない場合は登録できないこと" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = 'yasu1'
        @user.password_confirmation = 'yasu1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数混合でないと入力できないこと' do
        @user.password = "yasuyuki"
        @user.password_confirmation = 'yasuyuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = 'yasu0205'
        @user.password_confirmation = 'yasu0305'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end   
      it "last_nameがない場合は登録できないこと" do
        @user.last_name = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end  
      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_name_kanaがない場合は登録できないこと" do
        @user.last_name_kana = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaがない場合は登録できないこと" do
        @user.first_name_kana = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_nameが全角入力でなければ登録できないこと' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name = 'ﾘｸ'
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.last_name_kana = 'yamada'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end
      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_name_kana = 'riku'
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
      it "birthdayがない場合は登録できないこと" do
        @user.birthday = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
    
  end
end