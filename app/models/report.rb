class Report < ActiveRecord::Base
	has_many :report_details, dependent: :destroy

	
end