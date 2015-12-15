class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      t.string :name
      t.string :bio
      t.string :handle
      t.integer :user_id, null: false
      t.timestamps null: false
    end

    add_index :profiles, :user_id
  end
end
