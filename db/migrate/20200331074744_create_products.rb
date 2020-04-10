class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user,           null: false
      t.string :product_name,       null: false
      t.text :description,          null: false, foreign_key: true
      t.references :brand,                       default: ""
      t.references :condition,      null: false, default: 0
      t.references :size,           null: false, default: 0
      t.references :delivery_fee,   null: false, default: 0
      t.references :delivery_way,   null: false, default: 0
      t.references :delivery_date,  null: false, default: 0
      t.integer :price,             null: false
      t.references :prefecture,     null: false, default: 0
      t.integer :buyer_id,                       foreign_key: true

      t.timestamps
    end
  end
end
