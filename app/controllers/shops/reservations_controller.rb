class Shops::ReservationsController < ApplicationController
  def index
    shop = Shop.find(current_shop.id)
    @reservations = shop.reservations.all
    
  end

end
