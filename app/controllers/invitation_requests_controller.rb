class InvitationRequestsController < ApplicationController
  def new
    @invitation_request = InvitationRequest.new
  end


  def create
    if new_invitation.save
       new_invitation.send_email
       redirect_to :root
    else
      render :new
    end
  end

private

  def new_invitation
    @inviation_request ||= InvitationRequest.new(invitation_request_params)
  end

  def invitation_request_params
    params.require(:invitation_request).permit(:name, :email, :memo)
  end
end
