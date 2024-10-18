class AddDetailsToAuthors < ActiveRecord::Migration[7.2]
  def change
    add_column :authors, :last_name, :string
    add_column :authors, :email, :string
    add_column :authors, :age, :string
    add_column :authors, :country, :string
  end
end
