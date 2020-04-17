class ApplicationsController < ApplicationController

	get '/applications' do
		@artist = current_user
		@applications = @artist.applications

		erb :'applications/index'
	end

	get '/applications/new' do
		@institutions = Institution.all

		erb :'applications/new'
	end

	get '/applications/:id' do
		if current_user.application_ids.include?(params[:id])
			@application = Application.find(params[:id])
			erb :'applications/show'
		else
			"error"
			# redirect "/applications"
		end
	end

	get '/applications/:id/edit' do
		# implement measures against URL hacking here
		@application = Application.find(params[:id])
		@institutions = Institution.all

		erb :'/applications/edit'
	end

	post '/applications' do
		artist = current_user
		app = Application.create(params[:application])
		app.update(artist: current_user)

		redirect "/applications/#{app.id}"
	end

	patch '/applications/:id' do
		app = Application.find(params[:id])
		app.update(params[:application])

		redirect "applications/#{app.id}"
	end

end