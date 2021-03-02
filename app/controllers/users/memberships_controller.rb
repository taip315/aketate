class Users::MembershipsController < ApplicationController
  def destroy
    membership = Membership.find(params:id)
    membership.destroy
    redirect_back(fallback_location: users_shops_path)
  end
end
