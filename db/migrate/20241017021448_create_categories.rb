class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :status
      t.string :grade

      t.timestamps
    end
  end
end
