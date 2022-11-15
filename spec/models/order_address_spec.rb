require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    # @user = FactoryBot.build(:user)
    # @item = FactoryBot.build(:item)
    @order_address = FactoryBot.build(:order_address)
  end
  describe '商品の購入' do
    context '購入ができる場合' do
      it "必須項目が入力されていれば保存できる" do
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it "tokenが空では登録できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では保存ができない" do
        @order_address.post_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号は3桁ハイフン4桁の半角文字列しか保存ができない" do
        @order_address.post_code = "2220001"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "都道府県が空では登録できない" do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空では登録できない" do
        @order_address.municipality = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空では登録できない" do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では登録できない" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号は10桁以上11桁以内の半角数値しか登録できない" do
        @order_address.phone_number = "03-1111-1111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end