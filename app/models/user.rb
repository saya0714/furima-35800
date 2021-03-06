class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_one :card, dependent: :destroy

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角の英字と数字の両方を含めて設定してください' , on: :create
    
  with_options presence: true do
      validates :name
      validates :birthday
  end

  with_options presence: true, format: { with:  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を入力してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true,format: { with:  /\A[ァ-ヶー－]+\z/, message: 'を入力してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
