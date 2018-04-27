# == Schema Information
#
# Table name: extension_submissions
#
#  id                              :bigint(8)        not null, primary key
#  school_id                       :bigint(8)
#  year                            :string
#  perpanjangan_tugas_file_name    :string
#  perpanjangan_tugas_content_type :string
#  perpanjangan_tugas_file_size    :integer
#  perpanjangan_tugas_updated_at   :datetime
#  approved_by_admin               :boolean          default(FALSE)
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class ExtensionSubmission < ApplicationRecord
	attr_accessor :admin

	serialize :recent_extention, Array
	
  has_many :teachers

  belongs_to :school
  
  validates_presence_of :year, :recent_extention, unless: :admin
  validates_presence_of :perpanjangan_tugas, if: :admin

  has_attached_file :perpanjangan_tugas

  validates_attachment_content_type :perpanjangan_tugas,
																		content_type: ['image/jpeg', 'image/jpg', 'image/png', 'application/pdf'], message: 'format salah'
 	validates_attachment :perpanjangan_tugas, size: { in: 0..3.megabytes, message: 'maksimum 3 megabytes' }
 	validates_attachment_file_name :perpanjangan_tugas, matches: [/jpe?g\Z/, /png\Z/, /JP?G\Z/, /PNG\Z/, /PDF\Z/, /pdf\Z/]

 	# def approved_by_admin
 	# 	return '<span class="badge badge-success">Disetejui</span>'.html_safe if perpanjangan_tugas.present?
 	# 	# return '<span class="badge badge-warning">Diajukan Sekolah</span>'.html_safe  if sk_submission.present?
 	# end
 	def status
 		html=""
 		if perpanjangan_tugas.path.present?
 			html = '<span class="badge badge-success">Dikabulkan</span> | <a href='+perpanjangan_tugas.url+' download="Perpanjangan_Tugas_'+year+'_'+school.name+'">Download</a>'
 		else
 			html = '<span class="badge badge-danger">Belum Dikabulkan</span>'
 		end
 		html.html_safe
 	end

end
