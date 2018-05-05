# == Schema Information
#
# Table name: teachers
#
#  id                  :bigint(8)        not null, primary key
#  school_id           :bigint(8)
#  name                :string
#  pns                 :boolean
#  age                 :string
#  period_of_teaching  :string
#  number_of_extension :integer
#  expire              :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Teacher < ApplicationRecord
	has_many :sks, -> { order(:year => :asc) }, dependent: :destroy 
	has_many :extension_of_tasks, -> { order(:year => :asc) }, dependent: :destroy

  belongs_to :school, optional:true
  # belongs_to :sk_submission, optional:true

	validates_presence_of :name, :age, :period_of_teaching, :expire

		# scope :submissions, -> { joins(:sks, :extension_of_task).where("sks.date = price_movement.date")}
		# .select('teachers.id, teachers.name, teachers.pns, teachers.period_of_teaching,
		# 																					teachers.number_of_extension, teachers.expire, teachers.age,
		# 																					sks.year, sks.note') }
	def count_extension
		extension_of_tasks.count
	end

	def ext_next_year
		return Time.now.year if extension_of_tasks.blank?
		extension_of_tasks.map(&:year).sort.last.to_i+1
	end

	def sk_next_year
		return Time.now.year.to_i if sks.blank?
		sks.map(&:year).sort.last.to_i+1
	end

	def print_pns
		self.pns ? "PNS" : "Non PNS"
	end
	
	def print_expire
		html = expire.strftime('%d/%m/%Y')
		if (expire - 6.month) < Time.now
			html = '<span class="badge badge-danger blinking">'+html.to_s+'</span>'
		end
		
		html.html_safe
	end

	def status_sk
		unless pns
		# 	html = ""
		# 	if self.sk.present?
		# 		if sk.sk_submission
		# 			html = '<span class="badge badge-success">Disetujui</span>'
		# 		elsif sk.sk_submission.approved_by_admin
		# 			html = '<span class="badge badge-warning">Diajukan oleh Sekolah</span>'
		# 		else
		# 			html = '<span class="badge badge-primary">Dibuat</span>'
		# 		end
		# 	else
		# 		html = '<span class="badge badge-danger">Belum Diajukan</span>'
		# 	end
		# 	html.html_safe
		end
	end

end
