class OutboundImpressionsController < ApplicationController
	def index #why is create not working
		@story = Story.find(params[:story_id]) #why did I have to do this step?
		@story.story_impression(@story.id)
		redirect_to @story.url
	end
end

