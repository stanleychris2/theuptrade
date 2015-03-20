module Flags
  extend ActiveSupport::Concern

  included do
    has_many :flags, as: :flaggable
  end

  def record_flag(user)
    flag = self.flags.build(user: user)
    flag.save
    flag
  end

  def story_flag(story_id)
    flag = self.flag.build(story_id: story_id)
    flag.save
    flag
  end

end

