class ArtistsController < ApplicationController

	get '/artists' do
		@artists = Artist.all

		erb :'/artists/index'
	end

	get '/register' do
		erb :'/artists/register'
	end

	get '/artists/:slug' do
		# protect against URL hack
		@artist = Artist.find_by_slug(params[:slug])

		erb :'/artists/show'
	end

	get '/artists/:slug/edit' do
		# protect against URL hack
		@artist = Artist.find_by_slug(params[:slug])

		erb :'/artists/edit'
	end

	post '/artists' do
		artist = Artist.new(params[:artist])
		binding.pry
		if artist.save
			flash[:message] = "Account Successfully Created. Please log in."
			redirect '/login'
		else
			flash[:message] = artist_errors(artist)
			binding.pry
			redirect "/register"
		end
	end

	patch '/artists/:slug' do
		artist = Artist.find_by_slug(params[:slug])
		
		if artist.update(params[:artist])
			redirect "/artists/#{artist.slug}"
		else
			flash[:message] = artist_errors(artist)
			redirect "artists/#{params[:slug]}/edit"
		end
	end
end