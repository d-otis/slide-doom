class ApplicationsController < ApplicationController

	get '/applications' do
		if logged_in?
			@artist = current_user
			@applications = @artist.applications.order(id: :desc)

			erb :'applications/index'
		else
			redirect "/login"
		end
	end

	get '/applications/new' do
		if logged_in?
			@institutions = Institution.all

			erb :'applications/new'
		else
			redirect "/login"
		end
	end

	get '/applications/:id' do
		if logged_in?
			if current_user.application_ids.include?(params[:id].to_i)
				@application = Application.find(params[:id])
				erb :'applications/show'
			else
				flash[:message] = "Application not found."
				redirect "/applications"
			end
		else
			redirect "/login"
		end
	end

	get '/applications/:id/edit' do
		if logged_in?
			if current_user.application_ids.include?(params[:id].to_i)
				@application = Application.find(params[:id])
				@institutions = Institution.all
				erb :'applications/edit'
			else
				flash[:message] = "Application not found."
				redirect "/applications"
			end
		else
			redirect "/login"
		end
	end

	post '/applications' do
		if logged_in?
			artist = current_user
			app = Application.new(params[:application])
			app.artist = current_user

			if app.save
				flash[:message] = "Application successfully created!"
				redirect "/applications/#{app.id}"
			else
				flash[:message] = errors(app)
				
				redirect "applications/new"
			end
		else
			redirect "/login"
		end
	end

	patch '/applications/:id' do
		if logged_in?
			app = Application.find(params[:id])
			if app.update(params[:application])
				flash[:message] = "Successfully updated application."

				redirect "applications/#{app.id}"
			else
				flash[:message] = errors(app)

				redirect "/applications/#{app.id}/edit"
			end
		else
			redirect "/login"
		end
	end

	delete '/applications/:id' do
		if logged_in?
			application = Application.find(params[:id])
			if current_user.applications.include?(application)
				application.delete
			else
				flash[:message] = "Application not found."
			end

			redirect '/applications'
		else
			redirect "/login"
		end
	end

end