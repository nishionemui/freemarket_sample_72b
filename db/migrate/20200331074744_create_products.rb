class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user,           null: false
      t.string :product_name,       null: false
      t.text :description,          null: false, foreign_key: true
      t.references :brand,          null: false
      t.references :condition,      null: false
      t.references :size ,          null: false
      t.references :delivery_fee,   null: false
      t.references :delivery_way,   null: false
      t.references :delivery_date,  null: false
      t.integer :price,             null: false
      t.references :prefecture,     null: false
      t.integer :buyer_id,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
