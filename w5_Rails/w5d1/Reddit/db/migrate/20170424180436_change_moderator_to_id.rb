class ChangeModeratorToId < ActiveRecord::Migration[5.0]
  def change
    remove_column :subs, :moderator
    add_column :subs, :user_id, :integer
  end
end
