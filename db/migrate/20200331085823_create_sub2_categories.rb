class CreateSub2Categories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub2_categories do |t|
      t.references :sub_categories,         null: false
      t.string :sub2_name,                  null: false

      t.timestamps
    end
  end
end
