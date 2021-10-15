require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '購入先情報の保存' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @purchase_shipping = FactoryBot.create(:purchase_shipping, item_id: @item.id, user_id: @user.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_shipping.building_name = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_shipping.postal_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_shipping.postal_code = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_shipping.municipalities = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_shipping.address = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchase_shipping.telephone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁以上11桁以内の半角数値でないと保存できないこと' do
        @purchase_shipping.telephone_number = '080999900010'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
      end
      it 'userが紐づいていなければ登録できないこと' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
      end
      it 'itemが紐づいていなければ登録できないこと' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
      end
    end
  end
end
