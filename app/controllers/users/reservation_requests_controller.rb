class Users::ReservationRequestsController < ApplicationController

  def new
    @shop = Shop.find(params[:shop_id])
    @request = ReservationRequest.new(shop_id: params[:shop_id])
  end

  def create
    ReservationRequest.create(reservation_request_params)
    redirect_to root_path
    end

  private
  def reservation_request_params
    params.require(:reservation_request).permit(:date, :start_time, :number_of_people, :remarks).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
