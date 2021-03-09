class Users::ReservationsController < ApplicationController
  def index
    user = User.find(current_user.id)
    @reservations = user.reservations.all
    
  end
  def new
  end
  
  def create
  end

  def destroy
  end
  
end
