class RegistrationsController < Devise::RegistrationsController

  private

  # Must override the devise params to accomodate our custom user parameters.
  def sign_up_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                )
  end

  def account_update_params 
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :current_password,
                                )
  end

end
