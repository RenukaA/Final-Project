class ConnectionsController < ApplicationController
before_action :set_connection, only: [:edit, :update, :show]

	def index
		@connections = current_user.linked_in_connections
	end 

	def new 
		@connection = Connection.new(linkedin_id: params[:linkedin_id])
	end 

	def search
		@connection = Connection.find_by linkedin_id: params[:linkedin_id]
		if @connection 
			redirect_to edit_connection_path(@connection)

		else 
			redirect_to new_connection_path(linkedin_id: params[:linkedin_id])
		end 
	end 
	# shows the form

	def create
		@connection = Connection.new(safe_connection)

		if @connection.save
			redirect_to @connection

		else 
			render 'new'
		end 
	end
	# makes an object from form's info

	# need code that will force you to edit if information is already present, or create new if it isn't 

	def show
	end 

	def edit
	end 

	def update 
		@connection.update safe_connection
		redirect_to @connection
	end 

private 
	
	def safe_connection
		params.require(:connection).permit(:linkedin_id, :context_of_introduction, :role_or_purpose, :last_communication_date, :next_communication_date)
	end 

	def set_connection 
		@connection = Connection.find(params[:id])
	end 
end 
 

