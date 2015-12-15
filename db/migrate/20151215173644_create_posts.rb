class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :profile_id
      t.integer :likes_count, default: 0
      t.text :body

      t.timestamps null: false
    end
  end
end
