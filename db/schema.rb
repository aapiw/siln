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

ActiveRecord::Schema.define(version: 20180415133314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "country_code"
    t.string "iso_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extension_of_tasks", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "extension_submission_id"
    t.string "year"
    t.string "rekomendasi_perwakilan_file_name"
    t.string "rekomendasi_perwakilan_content_type"
    t.integer "rekomendasi_perwakilan_file_size"
    t.datetime "rekomendasi_perwakilan_updated_at"
    t.string "persetujuan_pemda_or_sekolah_file_name"
    t.string "persetujuan_pemda_or_sekolah_content_type"
    t.integer "persetujuan_pemda_or_sekolah_file_size"
    t.datetime "persetujuan_pemda_or_sekolah_updated_at"
    t.string "sk_mendikbud_file_name"
    t.string "sk_mendikbud_content_type"
    t.integer "sk_mendikbud_file_size"
    t.datetime "sk_mendikbud_updated_at"
    t.string "surat_persetujuan_setneg_file_name"
    t.string "surat_persetujuan_setneg_content_type"
    t.integer "surat_persetujuan_setneg_file_size"
    t.datetime "surat_persetujuan_setneg_updated_at"
    t.string "assessment"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["extension_submission_id"], name: "index_extension_of_tasks_on_extension_submission_id"
    t.index ["teacher_id"], name: "index_extension_of_tasks_on_teacher_id"
  end

  create_table "extension_submissions", force: :cascade do |t|
    t.bigint "school_id"
    t.string "year"
    t.string "perpanjangan_tugas_file_name"
    t.string "perpanjangan_tugas_content_type"
    t.integer "perpanjangan_tugas_file_size"
    t.datetime "perpanjangan_tugas_updated_at"
    t.boolean "approved_by_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_extension_submissions_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "display_password"
    t.string "name"
    t.datetime "remember_created_at"
    t.integer "country_id"
    t.string "responsible_school"
    t.string "phone"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_schools_on_username", unique: true
  end

  create_table "sk_submissions", force: :cascade do |t|
    t.string "year"
    t.bigint "school_id"
    t.boolean "approved_by_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_sk_submissions_on_school_id"
  end

  create_table "sks", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "sk_submission_id"
    t.string "year"
    t.string "permohonan_perwakilan_file_name"
    t.string "permohonan_perwakilan_content_type"
    t.integer "permohonan_perwakilan_file_size"
    t.datetime "permohonan_perwakilan_updated_at"
    t.string "ijazah_file_name"
    t.string "ijazah_content_type"
    t.integer "ijazah_file_size"
    t.datetime "ijazah_updated_at"
    t.string "sertifikat_pendidik_file_name"
    t.string "sertifikat_pendidik_content_type"
    t.integer "sertifikat_pendidik_file_size"
    t.datetime "sertifikat_pendidik_updated_at"
    t.string "nuptk_file_name"
    t.string "nuptk_content_type"
    t.integer "nuptk_file_size"
    t.datetime "nuptk_updated_at"
    t.string "sk_perwakilan_file_name"
    t.string "sk_perwakilan_content_type"
    t.integer "sk_perwakilan_file_size"
    t.datetime "sk_perwakilan_updated_at"
    t.string "ktp_or_paspor_file_name"
    t.string "ktp_or_paspor_content_type"
    t.integer "ktp_or_paspor_file_size"
    t.datetime "ktp_or_paspor_updated_at"
    t.string "kk_file_name"
    t.string "kk_content_type"
    t.integer "kk_file_size"
    t.datetime "kk_updated_at"
    t.string "cv_file_name"
    t.string "cv_content_type"
    t.integer "cv_file_size"
    t.datetime "cv_updated_at"
    t.string "sk_inpassing_file_name"
    t.string "sk_inpassing_content_type"
    t.integer "sk_inpassing_file_size"
    t.datetime "sk_inpassing_updated_at"
    t.string "biodata_ln_file_name"
    t.string "biodata_ln_content_type"
    t.integer "biodata_ln_file_size"
    t.datetime "biodata_ln_updated_at"
    t.string "form_biaya_file_name"
    t.string "form_biaya_content_type"
    t.integer "form_biaya_file_size"
    t.datetime "form_biaya_updated_at"
    t.string "pernyataan_file_name"
    t.string "pernyataan_content_type"
    t.integer "pernyataan_file_size"
    t.datetime "pernyataan_updated_at"
    t.string "note"
    t.string "sk_untuk_guru_file_name"
    t.string "sk_untuk_guru_content_type"
    t.integer "sk_untuk_guru_file_size"
    t.datetime "sk_untuk_guru_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sk_submission_id"], name: "index_sks_on_sk_submission_id"
    t.index ["teacher_id"], name: "index_sks_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.bigint "school_id"
    t.string "name"
    t.boolean "pns"
    t.string "age"
    t.string "period_of_teaching"
    t.integer "number_of_extension"
    t.date "expire"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_teachers_on_school_id"
  end

  add_foreign_key "extension_of_tasks", "extension_submissions"
  add_foreign_key "extension_of_tasks", "teachers"
  add_foreign_key "extension_submissions", "schools"
  add_foreign_key "sk_submissions", "schools"
  add_foreign_key "sks", "sk_submissions"
  add_foreign_key "sks", "teachers"
  add_foreign_key "teachers", "schools"
end
