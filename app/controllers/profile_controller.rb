class ProfileController < ApplicationController
  def profile
    authorize current_user
  end

  def update_profile
    authorize current_user
    if current_user.update(user_params)
      flash[:notice] = 'Account info successfully updated.'
      redirect_back(fallback_location: profile_path)
    else
      flash[:alert] = 'Failed to update account info.'
      render :profile
    end
  end

  def update_email_settings
    authorize current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
