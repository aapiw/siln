class Teacher < ApplicationRecord
  belongs_to :school
  belongs_to :sk_submission
	
	has_one :sk
	has_many :extension_of_task

end
