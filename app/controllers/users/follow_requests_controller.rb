class Users::FollowRequestsController < ApplicationController
  def create
    FollowRequest.create(follow_request_params)
    redirect_back(fallback_location: users_shops_path)
  end

  def destroy
    # binding.pry
    follow_request = FollowRequest.find_by(user_id: current_user.id, shop_id: params[:shop_id])
    follow_request.destroy
    redirect_back(fallback_location: users_shops_path)
  end

  private

  def follow_request_params
    params.permit(:shop_id).merge(user_id: current_user.id)
  end
end
