class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message: "は半角英数で入力して下さい" }
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "は漢字、全角ひらがな、全角カタカナで入力して下さい" }
    validates :first_kana, :last_kana, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: "は全角カタカナで入力して下さい" }
  end

  has_many :items
  # has_many :orders
  # has_many :comments



end
