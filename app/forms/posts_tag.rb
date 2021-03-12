class PostsTag

  include ActiveModel::Model
  attr_accessor :wine_name,:content,:price, :open_date, :wine_genre_id, :name, :shop_id, :sold_out
  
  with_options presence: true do 
    validates :wine_name
    validates :content
    validates :price, numericality: true
    validates :wine_genre_id, numericality: true
    validates :open_date
    validates :name
  end

  def save
    post = Post.create(
      wine_name: wine_name,
      content: content,
      price: price,
      open_date: open_date,
      wine_genre_id: wine_genre_id,
      shop_id: shop_id,
      sold_out: sold_out
    )

    tag = Tag.where(name: name).first_or_initialize
    tag.save
    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end


end

