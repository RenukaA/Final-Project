class GoalsController < ApplicationController
before_action :set_goal, only: [:edit, :destroy, :update]
	
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

	def edit 
	end 

	def index 
		@goals = Goal.all 
	end 

	def destroy
		@goal.delete
		redirect_to goals_path
	end 

	def update 
		@goal.update safe_goal
		redirect_to goals_path
	end 

private 

	def set_goal 
		@goal = Goal.find(params[:id])
	end 

	def safe_goal 
		params.require(:goal).permit(:title, :steps_needed, :steps_achieved, :priority, :target_date) 
	end 
end
