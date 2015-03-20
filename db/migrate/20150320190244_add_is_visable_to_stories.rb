class AddIsVisableToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :is_visable, :boolean, :default => true
  end
end
