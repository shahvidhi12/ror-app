class RenameAuthorsIdToAuthorId < ActiveRecord::Migration[7.2]
  def change
    rename_column :books, :authors_id, :author_id
  end
end
