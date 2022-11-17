require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end
  describe '商品の購入' do
    context '購入ができる場合' do
      it '必須項目が入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it '郵便番号が空では保存ができない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号は3桁ハイフン4桁の半角文字列しか保存ができない' do
        @order_address.post_code = '2220001'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号は-（ハイフン）を入れて入力してください')
      end
      it '都道府県が空では登録できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it '市区町村が空では登録できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空では登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号は10桁以上11桁以内の半角数値しか登録できない' do
        @order_address.phone_number = '03-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は-（ハイフン）を除いて半角で入力してください')
      end
      it '電話番号が9桁以下では購入できない' do
        @order_address.phone_number = '01234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は-（ハイフン）を除いて半角で入力してください')
      end
      it '電話番号が12桁以上では購入できない' do
        @order_address.phone_number = '01234567890123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は-（ハイフン）を除いて半角で入力してください')
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない（※半角数字以外が一文字でも含まれていれば良い）' do
        @order_address.phone_number = '012345678９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は-（ハイフン）を除いて半角で入力してください')
      end
      it 'userが紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("ユーザーを入力してください")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("商品を入力してください")
      end
    end
  end
end
