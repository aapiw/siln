class School < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable #:registerable,
         #:recoverable, :trackable, :validatable
 
 has_many :teachers
 has_many :sk_submissions
 has_many  :extension_submission
 belongs_to :country


end
