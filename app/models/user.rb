class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  with_options presence: true do 
  validates :nickname
  validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字、ひらがな、カタカナ）での入力が必要です" }
  validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字、ひらがな、カタカナ）での入力が必要です" }
  validates :last_kana,format: {with: /\A[ァ-ヶ]+\z/, message: "は全角カタカナでの入力が必要です" }
  validates :first_kana,format: {with: /\A[ァ-ヶ]+\z/, message: "は全角カタカナでの入力が必要です" }
  validates :birthday, format: {with: /\A\d{4}-\d{1,2}-\d{1,2}\z/} 
  validates :gender_id
  end
  validates :password,format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は英字と数字の両方を含めての入力が必要です"}
  validates :phone_number,format: {with: /\A\d{2,4}-\d{2,4}-\d{4}\z/}

  has_many :rooms
  has_many :memberships, dependent: :destroy
  has_many :follow_requests, dependent: :destroy
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  def already_requested?(shop)
    self.follow_requests.exists?(shop_id: shop.id)
  end

  def already_followed?(shop)
    self.memberships.exists?(shop_id: shop.id)
  end

  
end
