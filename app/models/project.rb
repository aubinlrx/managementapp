class Project < ActiveRecord::Base
	has_many :task_lists
	has_many :documents
end
