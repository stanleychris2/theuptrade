module Buzzy
  extend ActiveSupport::Concern
  included do

    scope :by_buzz_rating, -> {
      select("stories.*, (upvotes + downvotes + comments_count + (select count(trackable_id) from impressions where trackable_type='Story' AND trackable_id = stories.id)) as buzz").
        where("is_expired=0").order("buzz desc")
    }
  end
end
