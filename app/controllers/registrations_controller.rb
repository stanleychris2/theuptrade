class RegistrationsController < ApplicationController
	skip_before_filter :authenticate_user
  
  def new
		new_user(invitation_code: params[:invitation_code])
	end  

	def create
    if new_user(user_params).save
      redirect_to :root
    else 
      render :new 
    end
  end

private
  
  def new_user(attrs={})
    @user ||= User.new(attrs) 
  end

  def user_params
    params.require(:user).permit(
      :username, :email, :password, :password_confirmation, :about, :invitation_code
    )
  end
end
