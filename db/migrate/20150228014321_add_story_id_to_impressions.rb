class AddStoryIdToImpressions < ActiveRecord::Migration
  def change
    add_column :impressions, :story_id, :integer
  end
end
