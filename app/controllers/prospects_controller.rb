class ProspectsController < ApplicationController
	#new prospects go here
	def new
		@prospect = Prospect.new
	end
	#create the prospect
	def create
		@prospect = Prospect.new(prospect_params)
		if @prospect.save
			redirect_to root_path
			flash[:message] = "Your inquiry has been submitted"
		else
			render :new
			flash[:error] = "Form submission could not be submitted"
		end
	end

	private
	def prospect_params
		params.require(:prospect).permit(:name, :phone, :email, :inquiry)
	end
end