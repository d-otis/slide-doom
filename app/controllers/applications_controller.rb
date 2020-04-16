class ApplicationsController < ApplicationController

	get '/applications/new' do
		@institutions = Institution.all

		erb :'applications/new'
	end

	post '/applications' do
		binding.pry
	end

end