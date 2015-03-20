class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :flaggable, polymorphic:true
      t.references :user, index: true

      t.timestamps
    end
  end
end

