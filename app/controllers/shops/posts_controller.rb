class Shops::PostsController < ApplicationController
  def index
    if user_signed_in?
      redirect_to users_posts_path
    end
  end

  def new
    @post = Post.new
  end

  def create
    @shop = Shop.find(current_shop.id)
    @post = Post.new(post_params)
    if @post.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end
  def update
  end
  def destroy
  end
  def show
  end

  private
  def post_params
  params.permit(:wine_name,:content,:price, :open_date, :wine_genre_id).merge(shop_id: current_shop.id, sold_out: false)
  end

end
