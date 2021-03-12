class PostsController < ApplicationController
  skip_before_action :authenticate_any!
  before_action :redirect_to_toppage
  def top
    @posts = Post.includes(:shop)
  end


  private
  def redirect_to_toppage
    if user_signed_in?
      redirect_to users_posts_path
    elsif shop_signed_in?
      redirect_to shops_posts_path
    end
  end
end
