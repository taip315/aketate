class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters_users, if: :users_controller?
  before_action :configre_permitted_parameters_shops, if: :shops_controller?

  def configre_permitted_parameters_users
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:first_name, :last_name, :first_kana, :last_kana, :birthday, :gender_id])
  end
  def configre_permitted_parameters_shops
    devise_parameter_sanitizer.permit(:sign_up, keys: [:shop_name,:adoministrator, :postal, :prefecture_id, :address, :building, :nearest_station, :genre_id])
  end
end
