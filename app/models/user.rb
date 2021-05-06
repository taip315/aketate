class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角（漢字、ひらがな、カタカナ）での入力が必要です' }
    validates :first_name, format: { with: /\A^[ぁ-んァ-ン一-龥]+\z/, message: 'は全角（漢字、ひらがな、カタカナ）での入力が必要です' }
    validates :last_kana, format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角カタカナでの入力が必要です' }
    validates :first_kana, format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角カタカナでの入力が必要です' }
    validates :birthday, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}\z/, message: 'は半角数字での入力が必要です' }
    validates :gender_id
    validates :phone_number, format: { with: /\A\d{2,4}-\d{2,4}-\d{4}\z/, message: 'は半角数字での入力が必要です' }
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字の両方を含めての入力が必要です' }

  has_many :rooms
  has_many :memberships, dependent: :destroy
  has_many :shops, through: :memberships
  has_many :follow_requests, dependent: :destroy
  has_many :comments
  has_many :reservations, dependent: :destroy
  has_many :reservation_reqests, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  def already_requested?(shop)
    follow_requests.exists?(shop_id: shop.id)
  end

  def already_followed?(shop)
    memberships.exists?(shop_id: shop.id)
  end
end
