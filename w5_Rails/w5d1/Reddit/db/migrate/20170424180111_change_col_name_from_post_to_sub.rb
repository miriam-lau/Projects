class ChangeColNameFromPostToSub < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :post_id
    add_column :posts, :sub_id, :integer
  end
end
