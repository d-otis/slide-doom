class ArtistsController < ApplicationController

	get '/artists' do
		@artists = Artist.all

		erb :'/artists/index'
	end

	get '/register' do
		erb :'/artists/register'
	end

	post '/artists' do
		Artist.create(params[:artist])
		
		redirect '/login'
	end
end