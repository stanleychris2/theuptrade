
module Buzzy
  extend ActiveSupport::Concern

  included do
    extend ClassMethods
    extend ActiveSupport::Inflector

    default_scope -> { with_buzz }

    scope :with_buzz, -> {
      select("stories.*, #{buzz_sql}")
    }

    scope :by_buzz_rating, -> {
      order("buzz desc")
    }
  end

  module ClassMethods
    def buzz_sql
      "(upvotes + downvotes + comments_count + \
       (#{impressions_sql}) - (#{decay_score})).round as buzz"
    end

    def decay_score
      "SELECT abs(extract(epoch from NOW() - #{tableize(name)}.created_at)/99000000)"
    end

    def impressions_sql
      "select count(trackable_id) from impressions \
       where trackable_type='?' AND trackable_id = \
       #{tableize(name)}.id"
    end
  end
end
