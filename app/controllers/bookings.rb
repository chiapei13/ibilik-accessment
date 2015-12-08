# # Create New Booking to a (Property Listing)
# 	post '/properties/:property_id/bookings' do
# 		@property = Property.find(params[:property_id])
# 		# vote = @post.votes.create(user_id: session[:user_id], votes_count: 1)

# 		booking  = @property.bookings.find_or_initialize_by(user_id: session[:user_id])
# 		if booking.id.nil?
# 			booking.destroy
# 		else
# 			booking.status = 'booked'
# 			booking.save
# 		end	

# 		redirect "/properties/#{@property.id}"
# 	end


# Create New Booking to a (Property Listing) 
	get '/properties/:property_id/bookings/new' do
		@property = Property.find(params[:property_id])
		erb :"booking/new"
	end

# After Booking - form redirects to User/ Show
post '/properties/:property_id/bookings' do
	property = Property.find(params[:property_id])
	booking = property.bookings.create(start_date: params[:start_date], end_date: params[:end_date] ,user_id: current_user.id)
	user = booking.user
	redirect "/users/#{user.id}"
end

# Display Booking edit form
	get '/bookings/:id/edit' do
		@booking = Booking.find(params[:id])
		@property = @booking.property
		erb :"booking/edit"
	end

# Update Booking
	patch '/bookings/:id' do
		booking = Booking.find(params[:id])
		booking.update(start_date: params[:start_date], end_date: params[:end_date])
		user = booking.user
		redirect "/users/#{user.id}"
	end

# Delete Booking
	delete '/bookings/:id' do
		booking = Booking.find(params[:id])
		user = booking.user
		booking.destroy
		redirect "/users/#{user.id}"
	end

