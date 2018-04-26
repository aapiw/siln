# == Schema Information
#
# Table name: schools
#
#  id                  :bigint(8)        not null, primary key
#  username            :string           default(""), not null
#  email               :string
#  encrypted_password  :string           default(""), not null
#  display_password    :string
#  name                :string
#  remember_created_at :datetime
#  country_id          :integer
#  responsible_school  :string
#  phone               :string
#  admin               :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class School < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :rememberable#, :validatable
         #:recoverable, :trackable, :validatable
	before_save :show_password

	has_many :teachers
	has_many :sk_submissions
	has_many  :extension_submissions

	belongs_to :country

	validates_presence_of :username, :password, :name, :country_id
	validates :username, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
	validates :password, length: { minimum: 6 }
	# validates :email, uniqueness: true


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
