class PagesController < ApplicationController
	def about
    render "about.html.erb"
  end

  def terms
    render "tos.html.erb"
  end

  def privacy
    render "privacy.html.erb"
  end
end
