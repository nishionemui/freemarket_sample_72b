# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.



ActiveRecord::Schema.define(version: 2020_04_08_040912) do


  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "zip_code", null: false
    t.integer "prefecture_id", null: false
    t.string "city", null: false
    t.string "address1"
    t.string "address2"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "card_id", null: false
    t.string "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "main_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.string "main_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_main_categories_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "product_name", null: false
    t.text "description", null: false
    t.bigint "brand_id", default: 0
    t.bigint "condition_id", default: 0, null: false
    t.bigint "size_id", default: 0, null: false
    t.bigint "delivery_fee_id", default: 0, null: false
    t.bigint "delivery_way_id", default: 0, null: false
    t.bigint "delivery_date_id", default: 0, null: false
    t.integer "price", null: false
    t.bigint "prefecture_id", default: 0, null: false
    t.integer "buyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["condition_id"], name: "index_products_on_condition_id"
    t.index ["delivery_date_id"], name: "index_products_on_delivery_date_id"
    t.index ["delivery_fee_id"], name: "index_products_on_delivery_fee_id"
    t.index ["delivery_way_id"], name: "index_products_on_delivery_way_id"
    t.index ["prefecture_id"], name: "index_products_on_prefecture_id"
    t.index ["size_id"], name: "index_products_on_size_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "sub2_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "sub_categories_id", null: false
    t.string "sub2_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_categories_id"], name: "index_sub2_categories_on_sub_categories_id"
  end

  create_table "sub_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "main_categories_id", null: false
    t.string "sub_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["main_categories_id"], name: "index_sub_categories_on_main_categories_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.text "user_image"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_read", null: false
    t.string "last_name_read", null: false
    t.date "birthday", null: false
    t.text "introduction"
    t.integer "phone_num", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cards", "users"
end
