# Create new comment (to a Listing) - Redirects to a new page
	get '/properties/:property_id/comments/new' do
		@property = Property.find(params[:property_id])
		erb :"comment/new"
	end

# After replying to a Listing - form redirects to Property/ Show
	post '/properties/:property_id/comments' do
		property = Property.find(params[:property_id])
		comment = property.comments.create(body: params[:body],user_id: current_user.id)

		# Below is not so 'glamourous' way of doing
		# @answer = Answer.create(body: params[:body], user_id: session[:user_id], post_id: params[:post_id])
		# @post = @answer.post
		redirect "/properties/#{property.id}"
	end

###### Viewing Comments should route to property page itself
# # View/ Show answer 
# 	get '/answers/:id' do
# 		@answer = Answer.find(params[:id])
# 		@post = @answer.post
# 		erb :"post/show"
# 	end

# Display comment edit form
	get '/comments/:id/edit' do
		@comment = Comment.find(params[:id])
		@property = @comment.property
		erb :"comment/edit"
	end

# Update comment
	patch '/comments/:id' do
		comment = Comment.find(params[:id])
		comment.update(body: params[:body])
		@property = comment.property
		redirect "/properties/#{@property.id}"
	end

# Delete a comment
	delete '/comments/:id' do
		comment = Comment.find(params[:id])	
		@property = comment.property
		comment.destroy
		redirect "/properties/#{@property.id}"
	end

