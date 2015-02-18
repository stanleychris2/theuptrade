class RegistrationsController < ApplicationController
	skip_before_filter :authenticate_user
  
  def new
		new_user(invitation_code: params[:invitation_code])
	end  

	def create
    if new_user(user_params).save
      session[:u] = @user.session_token
      flash[:success] = "Welcome to #{Rails.application.name}, " <<
        "#{@user.username}!"

      Countinual.count!("#{Rails.application.shortname}.users.created", "+1")
      return redirect_to "/signup/invite"
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