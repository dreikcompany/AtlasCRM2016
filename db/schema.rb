# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160406102629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analysts", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "edad"
    t.text     "direccion"
    t.string   "telefono"
    t.string   "sexo"
    t.string   "estatus"
    t.integer  "enterprise_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  add_index "analysts", ["enterprise_id"], name: "index_analysts_on_enterprise_id", using: :btree
  add_index "analysts", ["user_id"], name: "index_analysts_on_user_id", using: :btree

  create_table "benefits", force: true do |t|
    t.string   "descripcion"
    t.string   "estatus",     limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calls", force: true do |t|
    t.date     "fechaini"
    t.time     "hora"
    t.string   "asunto"
    t.string   "descripcion"
    t.string   "estatus"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "calls", ["client_id"], name: "index_calls_on_client_id", using: :btree

  create_table "campaigns", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.float    "precio"
    t.date     "fechaini"
    t.date     "fechafin"
    t.string   "estatus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "edad"
    t.text     "direccion"
    t.string   "telefono"
    t.string   "sexo"
    t.string   "email"
    t.string   "estatus"
    t.integer  "enterprise_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["enterprise_id"], name: "index_clients_on_enterprise_id", using: :btree
  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "enterprise_memberships", force: true do |t|
    t.date     "f_inicio"
    t.date     "f_fin"
    t.decimal  "monto",         precision: 10, scale: 2
    t.string   "estatus"
    t.integer  "enterprise_id"
    t.integer  "membership_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enterprise_memberships", ["enterprise_id"], name: "index_enterprise_memberships_on_enterprise_id", using: :btree
  add_index "enterprise_memberships", ["membership_id"], name: "index_enterprise_memberships_on_membership_id", using: :btree

  create_table "enterprises", force: true do |t|
    t.string   "nom_enterprise"
    t.string   "nom_intranet"
    t.string   "rif"
    t.string   "vision"
    t.string   "mision"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "slogan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "user_id"
    t.string   "estatus",           limit: 1
    t.string   "descripcion"
    t.string   "email"
  end

  add_index "enterprises", ["user_id"], name: "index_enterprises_on_user_id", using: :btree

  create_table "excecutives", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "edad"
    t.text     "direccion"
    t.string   "telefono"
    t.string   "sexo"
    t.string   "email"
    t.string   "estatus"
    t.integer  "enterprise_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "excecutives", ["enterprise_id"], name: "index_excecutives_on_enterprise_id", using: :btree
  add_index "excecutives", ["user_id"], name: "index_excecutives_on_user_id", using: :btree

  create_table "meetings", force: true do |t|
    t.string   "asunto"
    t.string   "informacion"
    t.date     "fecha"
    t.time     "hora"
    t.string   "lugar"
    t.integer  "enterprise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meetings", ["enterprise_id"], name: "index_meetings_on_enterprise_id", using: :btree

  create_table "memberships", force: true do |t|
    t.string   "nombre"
    t.decimal  "monto",                precision: 10, scale: 2
    t.string   "estatus",    limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", force: true do |t|
    t.string   "url"
    t.string   "texto"
    t.integer  "padre"
    t.string   "estatus",    limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.float    "precio"
    t.integer  "cantidad"
    t.integer  "enterprise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fotoprincipal_file_name"
    t.string   "fotoprincipal_content_type"
    t.integer  "fotoprincipal_file_size"
    t.datetime "fotoprincipal_updated_at"
    t.string   "foto1_file_name"
    t.string   "foto1_content_type"
    t.integer  "foto1_file_size"
    t.datetime "foto1_updated_at"
    t.string   "foto2_file_name"
    t.string   "foto2_content_type"
    t.integer  "foto2_file_size"
    t.datetime "foto2_updated_at"
  end

  add_index "products", ["enterprise_id"], name: "index_products_on_enterprise_id", using: :btree

  create_table "promotion_memberships", force: true do |t|
    t.date     "f_inicio"
    t.date     "f_fin"
    t.decimal  "descuento",     precision: 3, scale: 2
    t.string   "estatus"
    t.integer  "membership_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descripcion"
  end

  add_index "promotion_memberships", ["membership_id"], name: "index_promotion_memberships_on_membership_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "nombre"
    t.string   "estatus",    limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templates", force: true do |t|
    t.string   "bg_h"
    t.string   "bg_a"
    t.string   "bg_f"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "logo2_file_name"
    t.string   "logo2_content_type"
    t.integer  "logo2_file_size"
    t.datetime "logo2_updated_at"
    t.string   "slider1_file_name"
    t.string   "slider1_content_type"
    t.integer  "slider1_file_size"
    t.datetime "slider1_updated_at"
    t.string   "slider2_file_name"
    t.string   "slider2_content_type"
    t.integer  "slider2_file_size"
    t.datetime "slider2_updated_at"
    t.string   "slider3_file_name"
    t.string   "slider3_content_type"
    t.integer  "slider3_file_size"
    t.datetime "slider3_updated_at"
    t.integer  "enterprise_id"
    t.string   "favicon_file_name"
    t.string   "favicon_content_type"
    t.integer  "favicon_file_size"
    t.datetime "favicon_updated_at"
    t.text     "t_slider1"
    t.text     "t_slider2"
    t.text     "t_slider3"
    t.string   "estatus",              limit: 1
  end

  add_index "templates", ["enterprise_id"], name: "index_templates_on_enterprise_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",            limit: 8
    t.string   "clave",               limit: 8
    t.text     "p_secreta"
    t.text     "r_secreta"
    t.string   "estatus",             limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

end
