class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories do |t|
      t.references :main_categories,        null: false
      t.string :sub_name,                   null: false

      t.timestamps
    end
  end
end
