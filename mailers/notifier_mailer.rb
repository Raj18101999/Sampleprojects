class NotifierMailer < ApplicationMailer
	def alert_admin
		mail(to: "  rails@gmail.com",subject: "Alert-A product has been added")
	end
end
