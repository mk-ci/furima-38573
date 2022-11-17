require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '新規登録' do
    context 'ユーザー情報を新規登録できるとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it '@を含むメールアドレスは登録できる' do
        @user.email = 'test@mail'
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上なら登録できる' do
        @user.password = '123456a'
        @user.password_confirmation = '123456a'
        expect(@user).to be_valid
      end
      it 'パスワードは半角英数字混合なら登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
      it '名前(全角)名字は全角（漢字・ひらがな・カタカナ）なら登録できる' do
        @user.last_name = 'やマ田'
        expect(@user).to be_valid
      end
      it '名前(全角)名前は全角（漢字・ひらがな・カタカナ）なら登録できる' do
        @user.first_name = 'りくタ郎'
        expect(@user).to be_valid
      end
      it '名前カナ(全角)名字は全角カタカナなら登録できる' do
        @user.first_name = 'タナカ'
        expect(@user).to be_valid
      end
      it '名前カナ(全角)名前は全角カタカナなら登録できる' do
        @user.last_name = 'アリサ'
        expect(@user).to be_valid
      end
    end
    context 'ユーザー情報を新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'メールアドレスが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'メールアドレスは、@を含む必要がある' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードは、6文字未満では登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '１２３４５６'
        @user.password_confirmation = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'パスワードとパスワード（確認）は、値が一致しないと登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '名前(全角)は、名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（全角）を入力してください")
      end
      it '名前(全角)は、名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名（全角）を入力してください")
      end
      it '名字は、全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓（全角）は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it '名前は、全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.first_name = 'rikutarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('名（全角）は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it '名前カナ(全角)名字が空では登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）を入力してください")
      end
      it '名前カナ(全角)名前が空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）を入力してください")
      end
      it '名前カナ(全角)名字は、全角（カタカナ）以外では登録できない' do
        @user.last_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓（カナ）は全角カタカナで入力してください')
      end
      it '名前カナ(全角)名前は、全角（カタカナ）以外では登録できない' do
        @user.first_kana = 'りくたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）は全角カタカナで入力してください")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
