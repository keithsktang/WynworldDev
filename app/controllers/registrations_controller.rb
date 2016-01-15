class RegistrationsController < Devise::RegistrationsController

  private

   def sign_up_params
     params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
   end

   def account_update_params
     params.require(:user).permit(:fname, :lname, :email, :latitude, :longitude, :password, :password_confirmation, :current_password)
   end

   def admin_user
      redirect_to root_url unless current_user.admin
   end

end