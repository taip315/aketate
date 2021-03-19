class Users::PostsController < ApplicationController
  skip_before_action :authenticate_any!, only: [:top,:search]
  before_action :redirect_to_toppage, only: :top
  before_action :set_q, only: [:index,:top,:search]
  
  def index
    @posts_all = Post.includes(:shop)
    @user = User.find(current_user.id)
    @following_shops = @user.shops
    @posts = @posts_all.where(shop_id: @following_shops).order(created_at: "DESC")
  end

  def show
  
  end
  
  
  def top
    @posts = Post.includes(:shop)
  end

  def search
    @posts = @q.result.includes(:shop)
  end


  private
  def redirect_to_toppage
    if user_signed_in?
      redirect_to users_posts_path
    elsif shop_signed_in?
      redirect_to shops_posts_path
    end
  end

  def set_q
    @q = Post.ransack(params[:q])
  end
end

