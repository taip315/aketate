class Post < ApplicationRecord
  with_options presence: true do 
    validates :wine_name, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角（漢字、ひらがな、カタカナ）での入力が必要です" }
    validates :content
    validates :price, numericality: true
    validates :wine_genre_id, numericality: true
    validates :open_date
  end

  
  belongs_to :shop
  has_many :comments

  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :wine_genre
end
