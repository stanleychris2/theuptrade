class AddIsVisableToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :is_visable, :boolean, :default => true
  end
end
