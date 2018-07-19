class AddFieldtoTeacher < ActiveRecord::Migration[5.1]
  def change
  	add_column :teachers, :lokasi, :string
  	add_column :teachers, :tgl_lahir, :date
  	add_column :teachers, :nip, :string
  	add_column :teachers, :jabatan, :string
  	add_column :teachers, :sk_pengangkatan, :string
  	add_column :teachers, :nuptk, :string
  	add_column :teachers, :unit_kerja_asal, :string
  	add_column :teachers, :no_sertifikasi_guru, :string
  	add_column :teachers, :bidang_studi, :string
  	add_column :teachers, :jumlah_jam_kerja, :string
  	add_column :teachers, :status_guru, :string
  	add_column :teachers, :gaji_pokok, :string
  	add_column :teachers, :tunjangan, :string
  	add_column :teachers, :masa_kerja_siln, :string
  	add_column :teachers, :sk_kemdikbud_no, :string
  	add_column :teachers, :sk_siln_no, :string
  	add_column :teachers, :tgl_awal_penugasan, :date
  	add_column :teachers, :tgl_akhir_penugasan, :date
  	add_column :teachers, :status_warga_negara, :string
  	add_column :teachers, :remarks, :string

	add_attachment :teachers, :document
	add_attachment :teachers, :photo

  end
end
