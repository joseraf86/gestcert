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

ActiveRecord::Schema.define(version: 20141113043836) do

  create_table "certificados", force: true do |t|
    t.string   "numero_certificado"
    t.string   "numero_guia_proveedor"
    t.string   "numero_codigo_producto"
    t.string   "numero_orden_compra"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proveedor_id"
    t.string   "adjunto_file_name"
    t.string   "adjunto_content_type"
    t.integer  "adjunto_file_size"
    t.datetime "adjunto_updated_at"
    t.date     "fecha_recepcion"
    t.integer  "sucursal_id"
    t.string   "system_id"
  end

  add_index "certificados", ["proveedor_id"], name: "index_certificados_on_proveedor_id", using: :btree
  add_index "certificados", ["sucursal_id"], name: "index_certificados_on_sucursal_id", using: :btree

  create_table "coladas", force: true do |t|
    t.string   "numero"
    t.integer  "certificado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coladas", ["certificado_id"], name: "index_coladas_on_certificado_id", using: :btree

  create_table "organizacions", force: true do |t|
    t.string   "nombre"
    t.string   "rif"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productos", force: true do |t|
    t.string   "codigo"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proveedors", force: true do |t|
    t.string   "name"
    t.string   "rif"
    t.boolean  "nacional"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.text     "the_role",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sucursals", force: true do |t|
    t.string   "nombre"
    t.integer  "organizacion_id"
    t.text     "direccion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sucursals", ["organizacion_id"], name: "index_sucursals_on_organizacion_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.integer  "sucursal_id"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

end
