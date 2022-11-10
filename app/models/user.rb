class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze }
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :first_kana, :last_kana, format: { with: /\A[\p{katakana}\u{30fc}]+\z/ }
  end

  has_many :items
  has_many :orders
  # has_many :comments
end
