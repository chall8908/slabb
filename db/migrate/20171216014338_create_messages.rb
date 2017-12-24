class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.belongs_to :sender, foreign_key: { to_table: :users }
      t.belongs_to :recipient, foreign_key: { to_table: :users }
      t.text :title
      t.text :body
      t.belongs_to :parent, foreign_key: { to_table: :messages }

      t.timestamps
    end
  end
end
