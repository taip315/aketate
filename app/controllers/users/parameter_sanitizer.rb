class Users::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:nickname,:first_name, :last_name, :first_kana, :last_kana, :birthday, :gender_id, :phone_number] )
  end
end