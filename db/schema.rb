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

ActiveRecord::Schema.define(version: 2020_11_22_025954) do

  create_table "designers", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "style"
    t.integer "quantity"
    t.integer "room_id", null: false
    t.integer "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_pieces_on_room_id"
    t.index ["store_id"], name: "index_pieces_on_store_id"
  end

  create_table "reference_photos", force: :cascade do |t|
    t.string "link"
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_reference_photos_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "wall_color"
    t.string "floor_color"
    t.string "light"
    t.integer "designer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["designer_id"], name: "index_rooms_on_designer_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "link"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pieces", "rooms"
  add_foreign_key "pieces", "stores"
  add_foreign_key "reference_photos", "rooms"
  add_foreign_key "rooms", "designers"
end
