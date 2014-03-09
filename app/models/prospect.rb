class Prospect < ActiveRecord::Base

	validates_presence_of :name, :inquiry

	validate :contact_information_present?

	private 
	def contact_information_present?
		unless phone.present? || email.present?
			errors.add(:base, "You must provide either an email address or phone number to complete this form.")
		end
	end

end