class Users::MembershipsController < ApplicationController
  def index
    user = User.find(current_user.id)
    @shops = user.shops
  end
  
  def destroy
    membership = Membership.find(params:id)
    membership.destroy
    redirect_back(fallback_location: users_shops_path)
  end
end
