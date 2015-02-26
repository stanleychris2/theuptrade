module Impressions
  extend ActiveSupport::Concern

  included do
    has_many :impressions, as: :trackable
  end

  def record_impression(user)
    impression = self.impressions.build(user: user)
    impression.save
    impression
  end
end
