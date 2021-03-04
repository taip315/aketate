class ApplicationController < ActionController::Base
  before_action :authenticate_any!

  def after_sign_in_path_for(resource)
    case resource
    when User
      users_posts_path
    when Shop
      shops_posts_path
    end
  end

  private
  def authenticate_any!
    unless shop_signed_in?
      authenticate_user!
    end
  end
  
  
  
  protected

  def devise_parameter_sanitizer
    if resource_class == User
      Users::ParameterSanitizer.new(User, :user, params)
    elsif resource_class == Shop
      Shops::ParameterSanitizer.new(Shop, :shop, params)
    else
      super
    end
  end
end



