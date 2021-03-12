class Post < ApplicationRecord
  

  
  belongs_to :shop
  has_many :comments
  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :wine_genre
end
