# Root - set root as Login Page for now
get '/' do
  erb :'user/index'
end

# View login page
	get '/users' do
		erb :'user/index'
	end

#  User login
	post '/users/login' do

		@user = User.authenticate(params[:email], params[:password])
		# user = User.find_by(email: params[:email], password: params[:password])
	
		if @user == nil
			erb :'user/index'

		else
			session[:user_id] = @user.id
		## session: will hold the user id throughout browsing, stores info on server instead of the browser (simplified version of cookie)
		redirect "/users/#{@user.id}"
		# redirect '/properties/index' #need to change redirection to here later
		end
	end

# Display new user form
	get '/users/new' do
		erb :"user/new"
	end

# Create new user
	post '/users' do
		user = User.create(name: params[:name], email: params[:email], password: params[:password])
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	# redirect '/properties/index' #need to change redirection to here later
	end

# View user profile
	get '/users/:id' do
		@user = User.find(params[:id])
		@profile = true  #for nav bar later
		erb :"user/show"
	end

	# User logout
	get '/logout' do
		session[:user_id] = nil
		erb :'user/index'
	end

# # Display user edit form
# 	get '/users/:id/edit' do
# 		@user = User.find(params[:id])
# 		erb :"user/edit"
# 	end

# # Update user
# 	patch '/users/:id' do
# 		user = User.find(params[:id])
# 		user.update(name: params[:name], 
# 								email: params[:email], 
# 								password: params[:password])
# 		redirect "/users/#{user.id}"
# 	end

# # Delete user
# 	delete '/users/:id' do
# 		user = User.find(params[:id])
# 		user.destroy
# 		erb :'user/index'
# 	end

# # Display all 'My Answers' from a user
# 	get '/users/:id/answers' do
# 		@user = User.find(params[:id])
# 		erb :'user/my_answers'
# 	end

