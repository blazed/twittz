class AddHandleLowerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :handle_lower, :string
  end
end
