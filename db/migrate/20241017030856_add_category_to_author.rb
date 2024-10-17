class AddCategoryToAuthor < ActiveRecord::Migration[7.2]
  def change
    add_reference :authors, :category, foreign_key: true
  end
end