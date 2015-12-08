class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :email, uniqueness: true

	has_many :properties
	has_many :comments
	has_many :bookings

	def self.authenticate(email,password)

		user = self.find_by(email: email, password: password)
			if user
				user
			else
				nil
			end
	end
end