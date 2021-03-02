class Shops::FollowRequestsController < ApplicationController
  def index
    @follow_requests = current_shop.follow_requests.all
  end

  def allow
    @follow_request = FollowRequest.find(params[:id])
    Membership.create(allow_params)
    @follow_request.destroy
    redirect_back(fallback_location: shops_shop_follow_requests_path(current_shop.id))
  end

  def destroy
    follow_request = FollowRequest.find(params[:id])
    follow_request.destroy
    redirect_back(fallback_location: shops_shop_follow_requests_path(current_shop.id))
  end
  

  private

  def allow_params
    params.permit(:shop_id).merge(user_id: @follow_request.user[:id])
  end
end
