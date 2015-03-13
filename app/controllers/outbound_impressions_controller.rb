class OutboundImpressionsController < ApplicationController
  before_action :secure_trackable_types!

  def create
    trackable.record_impression(current_user)
    if trackable.url != ""
    redirect_to trackable.url
    else
    redirect_to trackable.comments_url
    end
  end

private

  def secure_trackable_types!
    raise "Nice try funny guy" if !resource_is_not_trackable?
  end

  def trackable
    @trackable ||= params[:trackable_type].constantize.find(params[:trackable_id])
  end

  def resource_is_not_trackable?
    trackable.respond_to?(:impressions)
  end
end

