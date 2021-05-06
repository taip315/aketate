class Shops::PostsController < ApplicationController
  # skip_before_action :authenticate_any!, only: [:show]
  before_action :get_post, only: %i[show destroy]
  before_action :ensure_correct_shop, only: %i[show edit update destroy]

  def index
    redirect_to users_posts_path if user_signed_in?
    @posts = Post.where(shop_id: current_shop.id).order('open_date DESC')
  end

  def new
    @post_tag = PostsTag.new
  end

  def create
    @post_tag = PostsTag.new(post_params)
    tag_list = params[:post][:name].split(',')
    if @post_tag.valid?
      @post_tag.save(tag_list)
      redirect_to done_shops_posts_path
    else
      render 'new'
    end
  end

  def edit
    get_post
    @post_tag = PostsTag.new(post: @post)
  end

  def update
    get_post
    @post_tag = PostsTag.new(post_params, post: @post)
    tag_list = params[:post][:name].split(',')
    if @post_tag.valid?
      @post_tag.save(tag_list)
      redirect_to done_shops_posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to root_path if @post.destroy
  end

  def show; end

  private

  def post_params
    params.require(:post).permit(:wine_name, :vintage, :content, :price, :open_date, :wine_genre_id, :name, :sold_out,
                                 :image).merge(shop_id: current_shop.id)
  end

  def get_post
    @post = Post.find(params[:id])
  end

  def ensure_correct_shop
    @post = Post.find(params[:id])
    if user_signed_in?
      true
    elsif current_shop.id != @post.shop_id
      redirect_to root_path
    end
  end
end
