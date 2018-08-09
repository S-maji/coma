class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :title
      t.text :comment
      t.text :image_1
      t.text :image_2
      t.text :image_3
      
      t.timestamps null: false
    end
    add_index :posts, [:user_id, :created_at]
  end
end
