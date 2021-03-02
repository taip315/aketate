class Shops::MembershipsController < ApplicationController
  def index
    @followers = current_shop.memberships.all
  end

  def destroy
    membership = Membership.find(params[:id])
    membership.destroy
    redirect_back(fallback_location: shops_shop_memberships_path(current_shop.id))
  end
end
