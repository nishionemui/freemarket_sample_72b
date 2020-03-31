class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user,           null: false, foreign_key: true
      t.string :product_name,       null: false
      t.text :description,          null: false, foreign_key: true
      t.references :brand,          null: false, foreign_key: true
      t.references :condition,      null: false, foreign_key: true
      t.references :size ,          null: false, foreign_key: true
      t.references :delivery_fee,   null: false, foreign_key: true
      t.references :delivery_way,   null: false, foreign_key: true
      t.references :delivery_date,  null: false, foreign_key: true
      t.integer :price,             null: false
      t.references :prefecture,     null: false, foreign_key: true
      t.integer :buyer_id,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
