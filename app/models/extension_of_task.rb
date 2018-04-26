# == Schema Information
#
# Table name: extension_of_tasks
#
#  id                                        :bigint(8)        not null, primary key
#  teacher_id                                :bigint(8)
#  extension_submission_id                   :bigint(8)
#  year                                      :string
#  rekomendasi_perwakilan_file_name          :string
#  rekomendasi_perwakilan_content_type       :string
#  rekomendasi_perwakilan_file_size          :integer
#  rekomendasi_perwakilan_updated_at         :datetime
#  persetujuan_pemda_or_sekolah_file_name    :string
#  persetujuan_pemda_or_sekolah_content_type :string
#  persetujuan_pemda_or_sekolah_file_size    :integer
#  persetujuan_pemda_or_sekolah_updated_at   :datetime
#  sk_mendikbud_file_name                    :string
#  sk_mendikbud_content_type                 :string
#  sk_mendikbud_file_size                    :integer
#  sk_mendikbud_updated_at                   :datetime
#  surat_persetujuan_setneg_file_name        :string
#  surat_persetujuan_setneg_content_type     :string
#  surat_persetujuan_setneg_file_size        :integer
#  surat_persetujuan_setneg_updated_at       :datetime
#  assessment                                :string
#  note                                      :string
#  created_at                                :datetime         not null
#  updated_at                                :datetime         not null
#

class ExtensionOfTask < ApplicationRecord
   
  belongs_to :teacher
  belongs_to :extension_submission

  has_attached_file :rekomendasi_perwakilan
  has_attached_file :surat_persetujuan_setneg
  has_attached_file :persetujuan_pemda_or_sekolah
  has_attached_file :sk_mendikbud

  validates_presence_of :rekomendasi_perwakilan, :surat_persetujuan_setneg, :sk_mendikbud, :persetujuan_pemda_or_sekolah

  validates_attachment_content_type :rekomendasi_perwakilan, :surat_persetujuan_setneg,
  																	:sk_mendikbud, :persetujuan_pemda_or_sekolah, content_type: ['image/jpeg', 'image/jpg', 'image/png', 'application/pdf'],
  																	message: 'format salah'

  validates_attachment :rekomendasi_perwakilan, :surat_persetujuan_setneg, :sk_mendikbud, :persetujuan_pemda_or_sekolah,
  											size: { in: 0..3.megabytes, message: 'maksimum 3 megabytes' }

  validates_attachment_file_name :rekomendasi_perwakilan, :surat_persetujuan_setneg, :sk_mendikbud, :persetujuan_pemda_or_sekolah,
  																matches: [/jpe?g\Z/, /png\Z/, /JP?G\Z/, /PNG\Z/, /PDF\Z/, /pdf\Z/  ]
	def approved_by_admin
		return '<span class="badge badge-success">Disetejui</span>'.html_safe if sk_untuk_guru.present?
		return '<span class="badge badge-warning">Diajukan Sekolah</span>'.html_safe  if sk_submission.present?
	end

	def sk_url
		return sk_submission.url if sk_untuk_guru.present?
		return ''
	end
	
	def approved_by_admin
		return '<span class="badge badge-success">Disetejui</span>'.html_safe if extension_submission.present? and extension_submission.perpanjangan_tugas.present?
		return '<span class="badge badge-warning">Diajukan Sekolah</span>'.html_safe if extension_submission.present? 
	end

end
