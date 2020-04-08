class AddAncestryToMainCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :main_categories, :ancestry, :string
    add_index :main_categories, :ancestry
  end
end
