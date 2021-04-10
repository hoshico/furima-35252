require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '内容に問題ない場合' do
      it '全ての値が正しければ登録できること' do
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
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end  
      it "status_idがない場合は登録できないこと" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it "shipping_fee_status_idがない場合は登録できないこと" do
        @item.shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status Select")
      end
      it "prefecture_idがない場合は登録できないこと" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it 'scheduled_delivery_idがない場合は登録できないこと' do
        @item.scheduled_delivery_id = 0 
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
      it "priceが半角英数字混合では登録できないこと" do
        @item.price = "1111yen" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが半角英語だけでは登録できないこと" do
        @item.price = "tttttt" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが10,000,000以上では場合は登録できないこと" do
        @item.price = 10,000,000 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
    end
  end
end