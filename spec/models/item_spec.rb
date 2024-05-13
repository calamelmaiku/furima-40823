require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "nameとcomment、category_idとcondition_id、delivery_id、prefecture_id、span_id、price、userが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
  end
end
