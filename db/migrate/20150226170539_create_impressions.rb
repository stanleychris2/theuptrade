class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.references :trackable, polymorphic:true
      t.references :user, index: true

      t.timestamps
    end
  end
end
