module ApplicationHelper

	def admin
		@remote_ip = request.remote_ip
		@isadmin = ADMINIP.include?(@remote_ip)
	end


	def check_admin
    redirect_to :root unless @isadmin
	end
	
end
