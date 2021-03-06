# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_06_132939) do

  create_table "business_dates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "monday"
    t.string "tuesday"
    t.string "wedensday"
    t.string "thursday"
    t.string "friday"
    t.string "saturday"
    t.string "sunday"
    t.time "monday_opening_time"
    t.time "monday_closing_time"
    t.time "tuesday_opening_time"
    t.time "tuesday_closing_time"
    t.time "wedensday_opening_time"
    t.time "wedensday_closing_time"
    t.time "thursday_opening_time"
    t.time "thursday_closing_time"
    t.time "friday_opening_time"
    t.time "friday_closing_time"
    t.time "saturday_opening_time"
    t.time "saturday_closing_time"
    t.time "sunday_opening_time"
    t.time "sunday_closing_time"
    t.bigint "shop_admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_admin_id"], name: "index_business_dates_on_shop_admin_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "commitment_photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "shop_commitment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_commitment_id"], name: "index_commitment_photos_on_shop_commitment_id"
  end

  create_table "hashtags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "hashname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hashname"], name: "index_hashtags_on_hashname", unique: true
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.string "caption"
    t.bigint "shop_admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_admin_id"], name: "index_menus_on_shop_admin_id"
  end

  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "menu_id", null: false
    t.index ["menu_id"], name: "index_photos_on_menu_id"
  end

  create_table "post_hashtag_relations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "hashtag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hashtag_id"], name: "index_post_hashtag_relations_on_hashtag_id"
    t.index ["post_id"], name: "index_post_hashtag_relations_on_post_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "caption"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "price"
    t.bigint "shop_admin_id", null: false
    t.index ["caption"], name: "index_posts_on_caption", length: 32
    t.index ["shop_admin_id"], name: "index_posts_on_shop_admin_id"
  end

  create_table "shop_admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_shop_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shop_admins_on_reset_password_token", unique: true
  end

  create_table "shop_commitments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "shop_admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_admin_id"], name: "index_shop_commitments_on_shop_admin_id"
  end

  create_table "shop_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "store_name"
    t.string "address"
    t.string "email"
    t.string "phone_number"
    t.string "caption"
    t.bigint "shop_admin_id", null: false
    t.index ["shop_admin_id"], name: "index_shop_infos_on_shop_admin_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "profile_photo"
    t.string "username", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "business_dates", "shop_admins"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "commitment_photos", "shop_commitments"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "menus", "shop_admins"
  add_foreign_key "photos", "menus"
  add_foreign_key "post_hashtag_relations", "hashtags"
  add_foreign_key "post_hashtag_relations", "posts"
  add_foreign_key "posts", "shop_admins"
  add_foreign_key "shop_commitments", "shop_admins"
  add_foreign_key "shop_infos", "shop_admins"
end
