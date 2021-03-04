class Shops::PostsController < ApplicationController
  def index
    if user_signed_in?
      redirect_to users_posts_path
    end
  end
  def new
  end
  def create
  end
  def edit
  end
  def update
  end
  def destroy
  end
  def show
  end

end
