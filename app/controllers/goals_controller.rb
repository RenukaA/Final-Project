class GoalsController < ApplicationController

	def new 
		@goal = Goal.new 
	end
	
	def create 
		@goal = Goal.new(params[:goal].permit(:title, :steps_needed, :steps_achieved, :priority, :target_date))

		if @goal.save
			redirect_to goals_path
		else 
			render 'new'
		end 
	end 

	def show 
		@goal = Goal.find(params[:id])
	end 

	def index 
		@goals = Goal.all 
	end 

end
