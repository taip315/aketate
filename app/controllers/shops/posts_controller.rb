class Shops::PostsController < ApplicationController
  before_action :get_post, only:[:show,:destroy]
  before_action :ensure_correct_shop, only:[:show,:edit,:update,:destroy]

  def index
    if user_signed_in?
      redirect_to users_posts_path
    end
  
    @posts = Post.includes(:shop)
  end

  def new
    @post_tag = PostsTag.new
  end

  def create
    @post_tag = PostsTag.new(post_params)
    tag_list = params[:posts_tag][:name].split(',')
    if @post_tag.valid? 
      @post_tag.save(tag_list)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post_tag = PostsTag.new(post: @post)
  
  end

  def update
    @post = Post.find(params[:id])
    @post_tag = PostsTag.new(post_params,post: @post)
    tag_list = params[:post][:name].split(',')
    if @post_tag.valid?
      @post_tag.save(tag_list)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to root_path if @post.destroy
  end
  def show
    
  end

  private
  def post_params
  params.require(:posts_tag).permit(:wine_name,:content,:price, :open_date, :wine_genre_id, :name).merge(shop_id: current_shop.id, sold_out: false)
  end

  def get_post
    @post = Post.find(params[:id])
  end

  def ensure_correct_shop
    @post = Post.find(params[:id])
    if user_signed_in?
      true
    elsif  current_shop.id != @post.shop_id 
        redirect_to root_path
    end
  end

end
