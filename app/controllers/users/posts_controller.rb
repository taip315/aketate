class Users::PostsController < ApplicationController
  skip_before_action :authenticate_any!, only: [:top,:search]
  before_action :redirect_to_toppage, only: :top
  before_action :set_q, only: [:search,:top,:index]
  
  def index
    @tags = Tag.all
    @user = User.find(current_user.id)
    @following_shops = @user.shops

    if (params.has_key?(:follow) == false) || (params[:follow] == "off")
      @posts = Post.includes(:shop)
    else params[:follow] == "on"
      @posts = Post.includes(:shop).where(shop_id: @following_shops).order(created_at: "DESC")
    end

    @posts_open_date = @posts.order("open_date DESC")
  end

  def show
    @post = Post.find(params[:id])
  end
  
  
  def top
    @posts = Post.includes(:shop)
    @posts_open_date = Post.includes(:shop).order("open_date DESC")
  end

  def search
    @tags = Tag.all
    keywords = params[:q][:tags_name_cont_all].split(/[[:blank:]]+/)
    
    @posts = Post.has_tag_name_all(keywords)


    # @posts = Post.includes(:shop)
    # keywords.each do |keyword|
    #   next if keyword == ""
    #   @posts = @posts.joins(:tags).where(tags:{name: "#{keyword}"} )
    #   binding.pry
      
    # end
    
    #複数検索
    # @posts = []
    # keywords.each do |keyword|
    #   next if keyword == ""
    #   @posts += Post.ransack(tags_name_cont: "#{keyword}").result 
    # end
    # @posts.uniq!

    # grouping_hash = keywords.reduce({}){
    #   |hash, word| hash.merge(word=>{tags_name_cont: word})
    # }
    # @q = Post.ransack({combinator: 'and', groupings: grouping_hash})
    # @posts = @q.result.includes(:shop)
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

