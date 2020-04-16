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
		application = Application.create(params[:application])
		application.institution = Institution.find_by(params[:institution])
		application.save

		redirect "/applications/#{application.id}"
	end

end