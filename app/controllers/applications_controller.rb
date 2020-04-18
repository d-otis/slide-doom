class ApplicationsController < ApplicationController
	use Rack::Flash

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
		if current_user.application_ids.include?(params[:id].to_i)
			@application = Application.find(params[:id])
			erb :'applications/show'
		else
			flash[:message] = "Application not found."
			redirect "/applications"
		end
	end

	get '/applications/:id/edit' do
		if current_user.application_ids.include?(params[:id].to_i)
			@application = Application.find(params[:id])
			@institutions = Institution.all
			erb :'applications/edit'
		else
			flash[:message] = "Application not found."
			redirect "/applications"
		end

	end

	post '/applications' do
		artist = current_user
		app = Application.create(params[:application])
		app.update(artist: current_user)

		redirect "/applications/#{app.id}"
	end

	patch '/applications/:id' do
		app = Application.find(params[:id])
		if app.update(params[:application])
			flash[:message] = "Successfully updated application."

			redirect "applications/#{app.id}"
		else
			flash[:message] = app.errors.messages.collect do |k, v|
				"#{k.to_s.capitalize.gsub("_", " ")} #{v.join}"
			end

			redirect "/applications/#{app.id}/edit"
		end
	end

end