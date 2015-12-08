enable :sessions

# View properties homepage
	get '/properties/index' do
		@all_properties = Property.all
		@home = true
		erb :'property/index'
	end

# Display create new property form
	get '/properties/new' do
		@new_property = true
		erb :"property/new"
	end

# Create new property listing
	post '/properties' do
		property = Property.create(description: params[:description], location: params[:location], price: params[:price], availability: params[:availability], user_id: session[:user_id])
	redirect "/properties/#{property.id}"
	end

# View individual property listing
	get '/properties/:id' do
		@property = Property.find(params[:id])
		erb :"property/show"
	end

# Display property listing edit form
	get '/properties/:id/edit' do
		@property = Property.find(params[:id])
		erb :"property/edit"
	end

# Update property listing
	patch '/properties/:id' do
		property = Property.find(params[:id])

		property.update(description: params[:description], location: params[:location], price: params[:price], availability: params[:availability])

		redirect "/properties/#{property.id}"
	end

# Delete property listing
	delete '/properties/:id' do
		property = Property.find(params[:id])
		property.destroy
		redirect '/properties/index'
	end


