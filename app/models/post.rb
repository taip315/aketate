class Post < ApplicationRecord
  belongs_to :shop
  has_many :comments
  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :wine_genre

  scope :has_tag_name_all, -> tag_names{
    tag_names.map{|tag_name|
      joins(:tags).merge(Tag.where(name: tag_name))
      }.inject(:&)
  }
end
