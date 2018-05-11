# == Schema Information
#
# Table name: extension_of_tasks
#
#  id                                        :bigint(8)        not null, primary key
#  teacher_id                                :bigint(8)
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
#  approved_by_admin                         :boolean          default(FALSE)
#  created_at                                :datetime         not null
#  updated_at                                :datetime         not null
#

class ExtensionOfTask < ApplicationRecord
  attr_accessor :admin
  
  belongs_to :teacher
  belongs_to :extension_submission

  has_attached_file :rekomendasi_perwakilan
  has_attached_file :surat_persetujuan_setneg
  has_attached_file :persetujuan_pemda_or_sekolah
  has_attached_file :sk_mendikbud

  validates_presence_of :rekomendasi_perwakilan, :surat_persetujuan_setneg, :sk_mendikbud, :persetujuan_pemda_or_sekolah, unless: :admin
  validates_presence_of :note, if: :admin

  validates_attachment_content_type :rekomendasi_perwakilan, :surat_persetujuan_setneg,
  																	:sk_mendikbud, :persetujuan_pemda_or_sekolah, content_type: ['image/jpeg', 'image/jpg', 'image/png', 'application/pdf'],
  																	message: 'format salah'

  validates_attachment :rekomendasi_perwakilan, :surat_persetujuan_setneg, :sk_mendikbud, :persetujuan_pemda_or_sekolah,
  											size: { in: 0..3.megabytes, message: 'maksimum 3 megabytes' }

  validates_attachment_file_name :rekomendasi_perwakilan, :surat_persetujuan_setneg, :sk_mendikbud, :persetujuan_pemda_or_sekolah,
  																matches: [/jpe?g\Z/, /png\Z/, /JP?G\Z/, /PNG\Z/, /PDF\Z/, /pdf\Z/  ]
	# def approved_by_admin
	# 	return '<span class="badge badge-success">Disetejui</span>'.html_safe if sk_untuk_guru.present?
	# 	return '<span class="badge badge-warning">Diajukan Sekolah</span>'.html_safe  if sk_submission.present?
	# end

  # def has_submission
  #   relation = ExtensionSubmission.find_by_year(year)
  #   has_relation = relation ? relation.recent_extention.select{|d| d.to_s == id.to_s }.present? : nil

  #   if has_relation
  #     ExtensionSubmission.find(relation.id)
  #   else
  #     nil
  #   end
    
  # end

  def uploaded
    if extension_submission && extension_submission.perpanjangan_tugas.present? and extension_submission.perpanjangan_tugas.path
      '<span class="badge badge-success">Sudah</span>'.html_safe
    else 
      '<span class="badge badge-warning">Belum</span>'.html_safe
    end 
  end

  def status
    html = ""
    if extension_submission
      html +='<span class="badge badge-warning">Diajukan</span> '
      if extension_submission.perpanjangan_tugas.present? and extension_submission.perpanjangan_tugas.path
        html +='<span class="badge badge-success">Diupload</span> '
      end
    else
      html +='<span class="badge badge-danger">Belum Diajukan</span> ' 
    end

    if approved_by_admin
      html += '<span class="badge badge-success">Diverifikasi</span> '
    end
    html.html_safe
  end

  class << self

    def show_teachers_based_year teacher_ids, year
      joins(:teacher).where("year = ? AND teacher_id IN (?)", year, teacher_ids)
    end

    def extention_active_year teacher_ids
      joins(:teacher).where("teacher_id IN (?)", teacher_ids).pluck(:year).uniq
    end
  end

end
