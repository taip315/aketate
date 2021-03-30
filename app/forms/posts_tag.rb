class PostsTag

  include ActiveModel::Model
  attr_accessor :image, :wine_name,:content,:price, :open_date, :wine_genre_id, :name, :shop_id, :sold_out
  
  with_options presence: true do 
    validates :image
    validates :wine_name
    validates :content
    validates :price, numericality: true
    validates :wine_genre_id, numericality: true
    validates :open_date
    validates :name
  end

  delegate :persisted?, to: :post

  def initialize(attributes = nil, post: Post.new)
    @post = post
    attributes ||= default_attributes
    super(attributes) 
  end

  def save(tag_list)

    ActiveRecord::Base.transaction do
      @post.update(image: image, wine_name: wine_name,content: content,price: price, open_date: open_date, wine_genre_id: wine_genre_id, shop_id: shop_id, sold_out: sold_out)

      current_tags = @post.tags.pluck(:name) unless @post.tags.nil?
      old_tags = current_tags - tag_list
      new_tags = tag_list - current_tags

      old_tags.each do |old_name|
        @post.tags.delete Tag.find_by(name: old_name)
      end

      new_tags.each do |new_name|
        post_tag = Tag.find_or_create_by(name: new_name)
        @post.tags << post_tag
        post_tag_relation = PostTagRelation.where(post_id: @post.id, tag_id: post_tag.id).first_or_initialize
        post_tag_relation.update(post_id: @post.id, tag_id: post_tag.id)
      end

      

    end
  end
  
  def to_model
    post
  end


  private

  attr_reader :post, :tag

  def default_attributes
    {
      image: post.image,
      wine_name: post.wine_name,
      content: post.content,
      price: post.price,
      open_date: post.open_date,
      wine_genre_id: post.wine_genre_id,
      shop_id: post.shop_id,
      sold_out: post.sold_out,
      name: post.tags.pluck(:name).join(',')
    }
  end


end

