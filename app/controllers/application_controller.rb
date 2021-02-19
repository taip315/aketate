class ApplicationController < ActionController::Base
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

