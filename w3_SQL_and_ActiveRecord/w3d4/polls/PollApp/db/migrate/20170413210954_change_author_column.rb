class ChangeAuthorColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :polls, :author, :author_id
  end
end
