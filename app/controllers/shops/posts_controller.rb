class Shops::PostsController < ApplicationController
  def index
    if user_signed_in?
      redirect_to users_posts_path
    end
  
    @posts = Post.includes(:shop)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
  params.require(:post).permit(:wine_name,:content,:price, :open_date, :wine_genre_id).merge(shop_id: current_shop.id, sold_out: false)
  end

end
