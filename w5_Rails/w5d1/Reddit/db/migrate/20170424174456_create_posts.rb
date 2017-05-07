class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :content
      t.integer :post_id
      t.integer :author_id
      t.timestamps
    end
  end
end
