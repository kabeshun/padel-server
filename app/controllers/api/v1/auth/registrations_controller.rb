class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

  def create
    super
  end

  def sign_up_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
