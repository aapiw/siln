class CreateExtensionOfTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :extension_of_tasks do |t|
      t.references :teacher, foreign_key: true
      # t.references :extension_submission, foreign_key: true
      t.string :year
      t.attachment :rekomendasi_perwakilan
      t.attachment :persetujuan_pemda_or_sekolah
      t.attachment :sk_mendikbud
      t.attachment :surat_persetujuan_setneg
      t.string :assessment
      t.string :note
      t.boolean :approved_by_admin, default:false
      t.timestamps
    end
  end
end
