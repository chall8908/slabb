class AddDeletedAtColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :users,    :deleted_at, :datetime
    add_column :posts,    :deleted_at, :datetime
    add_column :messages, :deleted_at, :datetime
  end
end
