# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_14_193808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "abilities_pokemons", id: false, force: :cascade do |t|
    t.bigint "pokemon_id", null: false
    t.bigint "ability_id", null: false
    t.index ["ability_id", "pokemon_id"], name: "index_abilities_pokemons_on_ability_id_and_pokemon_id"
    t.index ["pokemon_id", "ability_id"], name: "index_abilities_pokemons_on_pokemon_id_and_ability_id"
  end

  create_table "poke_data", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "animation"
  end

  create_table "poke_types", force: :cascade do |t|
    t.string "name"
    t.string "double_damage_from", array: true
    t.string "double_damage_to", array: true
    t.string "half_damage_from", array: true
    t.string "half_damage_to", array: true
    t.string "no_damage_from", array: true
    t.string "no_damage_to", array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "poke_types_pokemons", id: false, force: :cascade do |t|
    t.bigint "pokemon_id", null: false
    t.bigint "poke_type_id", null: false
    t.index ["pokemon_id", "poke_type_id"], name: "index_poke_types_pokemons_on_pokemon_id_and_poke_type_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.bigint "trainer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.index ["trainer_id"], name: "index_pokemons_on_trainer_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pokemons", "trainers"
end
