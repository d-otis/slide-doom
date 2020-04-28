class ArtistsController < ApplicationController

	get '/artists' do
		@artists = Artist.all

		erb :'/artists/index'
	end

	get '/register' do
		erb :'/artists/register'
	end

	get '/artists/:slug' do
		if logged_in? 
			if current_user == Artist.find_by_slug(params[:slug])
				@artist = Artist.find_by_slug(params[:slug])

				erb :'/artists/show'
			else
				redirect "artists/#{current_user.slug}"
			end
		else
			redirect "/login"
		end
	end

	get '/artists/:slug/edit' do
		if logged_in?
			if current_user == Artist.find_by_slug(params[:slug])
				@artist = Artist.find_by_slug(params[:slug])

				erb :'/artists/edit'
			else
				redirect "artists/#{current_user.slug}"
			end
		else
			redirect "/login"
		end
	end

	post '/artists' do
		artist = Artist.new(params[:artist])
		if artist.save
			flash[:message] = "Account Successfully Created. Please log in."
			redirect '/login'
		else
			flash[:message] = artist_errors(artist)
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