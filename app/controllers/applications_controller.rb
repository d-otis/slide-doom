class ApplicationsController < ApplicationController

	get '/applications' do
		@applications = Application.all

		erb :'applications/index'
	end

	get '/applications/new' do
		@institutions = Institution.all

		erb :'applications/new'
	end

	get '/applications/:id' do

		erb :'applications/show'
	end

	post '/applications' do
		artist = Artist.find(session[:user_id])
		institution = Institution.find_by(params[:institution])
		app = institution.applications.create(artist: artist)
		# this is kind of klunky
		# can i sneak the artist id into the params hash?
		app.update(params[:application])

		redirect "/applications/#{application.id}"
	end

end