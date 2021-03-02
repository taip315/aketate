class Users::ShopsController < ApplicationController
  
  def show
    @shop = Shop.find(params[:id])
  end

  def search
    @shops = Shop.all
  end
end
