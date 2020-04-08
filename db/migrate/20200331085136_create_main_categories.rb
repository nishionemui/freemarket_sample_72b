class CreateMainCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :main_categories do |t|
      t.references :product
      t.string  :main_name,            null: false

      t.timestamps
    end
  end
end