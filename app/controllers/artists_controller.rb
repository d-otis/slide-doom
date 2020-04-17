class ArtistsController < ApplicationController

	get '/artists' do
		@artists = Artist.all

		erb :'/artists/index'
	end

	get '/register' do
		erb :'/artists/register'
	end

	get '/artists/:slug' do
		@artist = Artist.find_by_slug(params[:slug])

		erb :'/artists/show'
	end

	get '/artists/:slug/edit' do
		@artist = Artist.find_by_slug(params[:slug])

		erb :'/artists/edit'
	end

	post '/artists' do
		Artist.create(params[:artist])
		
		redirect '/login'
	end

	patch '/artists/:slug' do
		artist = Artist.find_by_slug(params[:slug])
		artist.update(params[:artist])

		redirect "/artists/#{artist.slug}"
	end
end