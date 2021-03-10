class Users::ReservationsController < ApplicationController
  def index
    user = User.find(current_user.id)
    @reservations = user.reservations.all
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
  end
  
end
