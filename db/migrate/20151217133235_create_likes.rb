class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :post, index: true
      t.references :profile, index: true

      t.timestamps null: false
    end
  end
end
