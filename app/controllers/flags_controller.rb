class FlagsController < ApplicationController
	
	
  def create
    flaggable.record_flag(current_user)
    if @flaggable.is_a?(Story)
      redirect_to flaggable.comments_url
      flash[:success] = "Thanks for flagging inappropriate stories, we appreciate it."
    else
      redirect_to flaggable.url
      flash[:success] = "Thanks for flagging inappropriate comments, we appreciate it."
    end
  end

private

  def secure_flaggable_types!
    raise "Nice try funny guy" if !resource_is_not_flaggable?
  end

  def flaggable
    @flaggable = params[:flaggable_type].constantize.find(params[:flaggable_id])
  end

  def resource_is_not_flaggable?
    flaggable.respond_to?(:flags)
  end

end