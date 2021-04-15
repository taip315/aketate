class Users::ReservationRequestsController < ApplicationController

  def new
    @shop = Shop.find(params[:shop_id])
    @request = ReservationRequest.new(shop_id: params[:shop_id])
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @request = ReservationRequest.new(reservation_request_params)
    if @request.valid?
      @request.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  private
  def reservation_request_params
    params.require(:reservation_request).permit(:date, :start_time, :number_of_people, :remarks).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
