class Users::MembershipsController < ApplicationController
  def index
    @memberships = current_user.memberships.all
  end
  
  def destroy
    membership = Membership.find(params:id)
    membership.destroy
    redirect_back(fallback_location: users_shops_path)
  end
end
