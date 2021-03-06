class Users::PostsController < ApplicationController
  def index
    @posts_all = Post.includes(:shop)
    @user = User.find(current_user.id)
    @following_shops = @user.shops
    @posts = @posts_all.where(shop_id: @following_shops).order(created_at: "DESC")
  end
  def show
  end
end
