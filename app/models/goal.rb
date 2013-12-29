class Goal < ActiveRecord::Base

	validates :priority, :inclusion => 1..10 

end