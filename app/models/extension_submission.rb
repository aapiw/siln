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
#  recent_extention                :text
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class ExtensionSubmission < ApplicationRecord
	attr_accessor :admin, :extention_ids

	# serialize :recent_extention, Array
	
  has_many :teachers
  has_many :extension_of_tasks

  belongs_to :school
  
  validates_presence_of :year, unless: :admin
  validates_presence_of :perpanjangan_tugas, if: :admin

  has_attached_file :perpanjangan_tugas

  validates_attachment_content_type :perpanjangan_tugas,
																		content_type: ['image/jpeg', 'image/jpg', 'image/png', 'application/pdf'], message: 'format salah'
 	validates_attachment :perpanjangan_tugas, size: { in: 0..3.megabytes, message: 'maksimum 3 megabytes' }
 	validates_attachment_file_name :perpanjangan_tugas, matches: [/jpe?g\Z/, /png\Z/, /JP?G\Z/, /PNG\Z/, /PDF\Z/, /pdf\Z/]

  after_save :update_extention, if: :extention_ids

 	# def approved_by_admin
 	# 	return '<span class="badge badge-success">Disetejui</span>'.html_safe if perpanjangan_tugas.present?
 	# 	# return '<span class="badge badge-warning">Diajukan Sekolah</span>'.html_safe  if sk_submission.present?
 	# end
  def update_extention
    extention_ids.reject!(&:blank?)
    if extention_ids.map{|e| e.to_i }.sort != self.extension_of_tasks.pluck(:id).sort
      ExtensionOfTask.where(id: self.extension_of_tasks.pluck(:id), year:self.year).update_all(extension_submission_id:nil)
      ExtensionOfTask.where(id: extention_ids, year:self.year).update_all(extension_submission_id:self.id)  
    end
    
  end

 	def status
 		html=""
 		if perpanjangan_tugas.path.present?
 			html = '<span class="badge badge-success">Dikabulkan</span> | <a href='+perpanjangan_tugas.url+' download="Perpanjangan_Tugas_'+year+'_'+school.name+'">Download</a>'
 		else
 			html = '<span class="badge badge-danger">Belum Dikabulkan</span>'
 		end
 		html.html_safe
 	end

  class << self
    def next_year
      return Time.now.year if count < 1
      all.map(&:year).sort.last.to_i+1
    end
    def has_extention
      ExtensionOfTask.extention_active_year
    end
  end

end
