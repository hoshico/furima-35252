require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '内容に問題ない場合' do
      it 'imageあれば登録できること' do
        expect(@item).to be_valid
      end
      it "nameがあれば登録できること" do
        @item.name = '絵本'
        expect(@item).to be_valid
      end
      it "infoがあれば登録できる" do
        @item.info = '50ページ'
        expect(@item).to be_valid
      end   
      it "category_idがあれば登録できること" do
        @item.category_id = '2'
        expect(@item).to be_valid
      end  
      it "status_idがあれば登録できること" do
        @item.status_id = '2'
        expect(@item).to be_valid
      end
      it "shipping_fee_status_idがあれば登録できること" do
        @item.shipping_fee_status_id = '2'
        expect(@item).to be_valid
      end
      it "prefecture_idがあれば登録できること" do
        @item.prefecture_id = '2'
        expect(@item).to be_valid
      end
      it 'scheduled_deliveryがあれば登録できること' do
        @item.scheduled_delivery_id = '2'
        expect(@item).to be_valid
      end
      it 'priceがあれば登録できること' do
        @item.price = '450'
        expect(@item).to be_valid
      end
      it 'priceが¥300~¥9,999,999の間であれば登録できること' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
      it "priceが半角数字であれば登録できること" do
        @item.price = '70000'
        expect(@item).to be_valid
      end  
    end

    context '内容に問題がある場合' do
      it 'imageがない場合は登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameがない場合は登録できないこと" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "infoがない場合は登録できないこと" do
        @item.info = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end   
      it "category_idがない場合は登録できないこと" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end  
      it "status_idがない場合は登録できないこと" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it "shipping_fee_status_idがない場合は登録できないこと" do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status Select")
      end
      it "prefecture_idがない場合は登録できないこと" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it 'scheduled_delivery_idがない場合は登録できないこと' do
        @item.scheduled_delivery_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery Select")
      end
      it 'priceがない場合は登録できないこと' do
        @item.price = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300~¥9,999,999の間でない場合は登録できないこと' do
        @item.price = 200 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが半角数字でない場合は登録できないこと" do
        @item.price = "５００" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
    end
  end
end