class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do 
  validates :shop_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字、ひらがな、カタカナ）での入力が必要です" }
  validates :administrator, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字、ひらがな、カタカナ）での入力が必要です" }
  validates :postal, format: {with: /\A\d{3}-\d{4}\z/}
  validates :prefecture_id, format: {with: /\A\d{1,2}\z/ }
  validates :address
  validates :nearest_station,format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字、ひらがな、カタカナ）での入力が必要です" }
  validates :genre_id,format: {with: /\A\d{1,2}\z/ }
  validates :phone_number,format: {with: /\A\d{2,4}-\d{2,4}-\d{4}\z/}
  end
  validates :building, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字、ひらがな、カタカナ）での入力が必要です" }
  validates :password,format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は英字と数字の両方を含めての入力が必要です"}

  has_many :rooms
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :genre
  
  
end
