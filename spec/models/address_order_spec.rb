require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    item = FactoryBot.build(:item)
    user = FactoryBot.build(:user)
    @address_order = FactoryBot.build(:address_order, item_id: item.id, user_id: user.id)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "postcodeとprefecture_id、cityとstreet、telephone、orderが存在すれば登録できる" do
        expect(@address_order).to be_valid
      end
      it "buildが空でも登録できる" do
        @address_order.build = ''
        expect(@address_order).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'postcodeが空では登録できない' do
        @address_order.postcode = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @address_order.prefecture_id = '0'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @address_order.city = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空では登録できない' do
        @address_order.street = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Street can't be blank")
      end
      it 'telephoneが空では登録できない' do
        @address_order.telephone = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'postcodeは、ハイフンがないと登録できない' do
        @address_order.postcode = '0000000'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it 'telephoneは、10桁未満では登録できない' do
        @address_order.telephone = '000000000'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Telephone is too short (minimum is 10 characters)")
      end
      it 'telephoneは、11桁以上では登録できない' do
        @address_order.telephone = '000000000000'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
      end
    end
  end
end