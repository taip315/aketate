class Post < ApplicationRecord
  belongs_to :shop
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_one_attached :image

  validate :image_content_type, if: :was_attached?

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :wine_genre

  scope :has_tag_name_all, lambda { |tag_names|
    tag_names.map do |tag_name|
      joins(:tags).merge(Tag.where(name: tag_name))
    end.inject(:&)
  }

  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg']
    errors.add(:image, 'の拡張子が間違っています。png, jpg, jpegいずれかで指定してください。') unless image.content_type.in?(extension)
  end

  def was_attached?
    image.attached?
  end
end
