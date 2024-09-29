class AddPostLevelToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :post_level, :integer, default: 0, null: false
    User.update_all(post_level: 0)
  end

  def down
    remove_column :users, :post_level
  end
end
