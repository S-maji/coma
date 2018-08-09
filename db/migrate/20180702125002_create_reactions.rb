class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.integer :post_id
      t.text :comment
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
