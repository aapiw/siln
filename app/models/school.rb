class School < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :rememberable #:registerable,
         #:recoverable, :trackable, :validatable
	before_save :show_password

	has_many :teachers
	has_many :sk_submissions
	has_many  :extension_submission

	belongs_to :country

	validates_presence_of :username, :password, :name, :country_id
	validates :username, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
	validates :password, length: { minimum: 6 }
	validates :email, uniqueness: true


	def count_pns
		self.teachers.where(pns:true).count
	end

	def count_non_pns
		self.teachers.where(pns:false).count
	end

	def count_pns_will_expire
		self.teachers.where(pns:true).count
	end

	def count_non_pns_will_expire
		self.teachers.where(pns:false).count
	end

	def count_pns_expire
		self.teachers.where('pns = ? AND expire < ?', true, Time.now).count
	end

	def count_non_pns_expire
		self.teachers.where('pns = ? AND expire < ?', false, Time.now).count
	end

	def show_password
		self.display_password = password
	end

	def type
		admin ? "Admin" : "Sekolah"
	end

end
