# == Schema Information
#
# Table name: sks
#
#  id                                 :bigint(8)        not null, primary key
#  teacher_id                         :bigint(8)
#  year                               :string
#  permohonan_perwakilan_file_name    :string
#  permohonan_perwakilan_content_type :string
#  permohonan_perwakilan_file_size    :integer
#  permohonan_perwakilan_updated_at   :datetime
#  ijazah_file_name                   :string
#  ijazah_content_type                :string
#  ijazah_file_size                   :integer
#  ijazah_updated_at                  :datetime
#  sertifikat_pendidik_file_name      :string
#  sertifikat_pendidik_content_type   :string
#  sertifikat_pendidik_file_size      :integer
#  sertifikat_pendidik_updated_at     :datetime
#  nuptk_file_name                    :string
#  nuptk_content_type                 :string
#  nuptk_file_size                    :integer
#  nuptk_updated_at                   :datetime
#  sk_perwakilan_file_name            :string
#  sk_perwakilan_content_type         :string
#  sk_perwakilan_file_size            :integer
#  sk_perwakilan_updated_at           :datetime
#  ktp_or_paspor_file_name            :string
#  ktp_or_paspor_content_type         :string
#  ktp_or_paspor_file_size            :integer
#  ktp_or_paspor_updated_at           :datetime
#  kk_file_name                       :string
#  kk_content_type                    :string
#  kk_file_size                       :integer
#  kk_updated_at                      :datetime
#  cv_file_name                       :string
#  cv_content_type                    :string
#  cv_file_size                       :integer
#  cv_updated_at                      :datetime
#  sk_inpassing_file_name             :string
#  sk_inpassing_content_type          :string
#  sk_inpassing_file_size             :integer
#  sk_inpassing_updated_at            :datetime
#  biodata_ln_file_name               :string
#  biodata_ln_content_type            :string
#  biodata_ln_file_size               :integer
#  biodata_ln_updated_at              :datetime
#  form_biaya_file_name               :string
#  form_biaya_content_type            :string
#  form_biaya_file_size               :integer
#  form_biaya_updated_at              :datetime
#  pernyataan_file_name               :string
#  pernyataan_content_type            :string
#  pernyataan_file_size               :integer
#  pernyataan_updated_at              :datetime
#  note                               :string
#  sk_untuk_guru_file_name            :string
#  sk_untuk_guru_content_type         :string
#  sk_untuk_guru_file_size            :integer
#  sk_untuk_guru_updated_at           :datetime
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#

class Sk < ApplicationRecord
  belongs_to :teacher
  # belongs_to :sk_submission, optional:true

	attr_accessor :admin
	
	scope :search_year, -> (year) { where('extract(year  from users.created_at) = ?', year) }
	# scope :display_teacher, -> (year)
	scope :sks_and_extentions, -> { joins(:extension_of_task).select("*")}
	
	# Sk.joins(:teacher).where("year = ? AND teacher_id IN (?)", "2018", [current_school.teachers.pluck(:id)])

	has_attached_file :permohonan_perwakilan
	has_attached_file :ijazah
	has_attached_file :sertifikat_pendidik
	has_attached_file :nuptk
	has_attached_file :sk_perwakilan
	has_attached_file :ktp_or_paspor
	has_attached_file :kk
	has_attached_file :cv
	has_attached_file :sk_inpassing
	has_attached_file :biodata_ln
	has_attached_file :form_biaya
	has_attached_file :pernyataan
	has_attached_file :sk_untuk_guru

	validates_presence_of :year, :permohonan_perwakilan, :ijazah, :sertifikat_pendidik,
												:nuptk, :sk_perwakilan, :ktp_or_paspor, :kk, :cv,
												:biodata_ln, :form_biaya, :pernyataan, unless: :admin
												
	validates_presence_of	:sk_untuk_guru, :note,  if: :admin

	validates_attachment_content_type :permohonan_perwakilan, :ijazah, :sertifikat_pendidik,
																		:nuptk, :sk_perwakilan, :ktp_or_paspor, :kk, :cv,
																		:sk_inpassing, :biodata_ln, :form_biaya, :pernyataan,
																		:sk_untuk_guru,
																		content_type: ['image/jpeg', 'image/jpg', 'image/png', 'application/pdf'], message: 'format salah'#, if: :script

  validates_attachment :permohonan_perwakilan, :ijazah, :sertifikat_pendidik,
											:nuptk, :sk_perwakilan, :ktp_or_paspor, :kk, :cv,
											:sk_inpassing, :biodata_ln, :form_biaya, :pernyataan,
											:sk_untuk_guru, size: { in: 0..3.megabytes, message: 'maksimum 3 megabytes' }

  validates_attachment_file_name :permohonan_perwakilan, :ijazah, :sertifikat_pendidik,
																	:nuptk, :sk_perwakilan, :ktp_or_paspor, :kk, :cv,
																	:sk_inpassing, :biodata_ln, :form_biaya, :pernyataan,
																	:sk_untuk_guru, matches: [/jpe?g\Z/, /png\Z/, /JP?G\Z/, /PNG\Z/, /PDF\Z/, /pdf\Z/]

	def status
		return '<span class="badge badge-success">Disetejui</span>'.html_safe if sk_untuk_guru.present?
		if SkSubmission.find_by_year(year).recent_sk.select{|d| d.to_s == id.to_s }.present?
			'<span class="badge badge-warning">Diajukan</span>'.html_safe 
		else
			'<span class="badge badge-danger">Belum Diajukan</span>'.html_safe
		end
	end

	# def sk_url
	# 	return sk_untuk_guru.url if sk_untuk_guru.present?
	# 	return ''
	# end

	class << self
		def show_teachers_based_year teacher_ids, year
			joins(:teacher).where("year = ? AND teacher_id IN (?)", year, teacher_ids)
		end

		def sk_active_year teacher_ids
			joins(:teacher).where("teacher_id IN (?)", teacher_ids).pluck(:year).uniq
		end

		# def update_sk_submission_ids sk_submission_id, ids
		# 	ids.reject!{|e| e.blank?}
		# 	self.where("id in (?)", ids).update_all(sk_submission_id:sk_submission_id)
		# end
	end
	

end
