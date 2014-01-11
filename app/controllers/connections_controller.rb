class ConnectionsController < ApplicationController

	def index
		@connections = current_user.connections
	end 

	def search
		query = params[:q]
		@connections = connection.search_for query
	end 

end 
