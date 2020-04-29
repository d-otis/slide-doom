class ArtistsController < ApplicationController

	get '/register' do
		erb :'/artists/register'
	end

	get '/artists/:slug' do
		if logged_in? 
			if current_user == Artist.friendly.find(params[:slug])
				@artist = Artist.friendly.find(params[:slug])

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
			if current_user == Artist.friendly.find(params[:slug])
				@artist = Artist.friendly.find(params[:slug])

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
			flash[:message] = errors(artist)

			redirect "/register"
		end
	end

	patch '/artists/:slug' do
		artist = Artist.friendly.find(params[:slug])
		
		if artist.update(params[:artist])
			redirect "/artists/#{artist.slug}"
		else
			flash[:message] = artist_errors(artist)
			redirect "artists/#{params[:slug]}/edit"
		end
	end

	delete '/artists/:slug' do
		# protect against URL hacking
		if logged_in?
			artist = Artist.friendly.find(params[:slug])
			if current_user == artist
				artist = Artist.friendly.find(params[:slug])
				artist.destroy

				logout
			else
				redirect "/artists/#{current_user.slug}"
			end
		else
			redirect "/login"
		end
	end
end