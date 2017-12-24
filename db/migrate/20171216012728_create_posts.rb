class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.belongs_to :creator, foreign_key: { to_table: :users }
      t.text :title
      t.text :body
      t.belongs_to :parent, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
