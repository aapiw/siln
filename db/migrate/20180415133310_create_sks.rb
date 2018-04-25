class CreateSks < ActiveRecord::Migration[5.1]
  def change
    create_table :sks do |t|
      t.references :teacher, foreign_key: true
      t.references :sk_submission, foreign_key: true
      t.string :year
      t.attachment :permohonan_perwakilan
      t.attachment :ijazah
      t.attachment :sertifikat_pendidik
      t.attachment :nuptk
      t.attachment :sk_perwakilan
      t.attachment :ktp_or_paspor
      t.attachment :kk
      t.attachment :cv
      t.attachment :sk_inpassing
      t.attachment :biodata_ln
      t.attachment :form_biaya
      t.attachment :pernyataan
      t.string :note
      t.attachment :sk_untuk_guru

      t.timestamps
    end
  end
end
