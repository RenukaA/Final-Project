class AdminsController < ApplicationController
before_action :authenticate_user!

  def new 
	@admnin = Admin.new 
  end
   
  def show
  end 

end
