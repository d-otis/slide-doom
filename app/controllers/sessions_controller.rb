class SessionsController < ApplicationController

	get '/login' do

		erb :'sessions/login'
	end

	post '/login' do
		artist = Artist.find_by(email: params[:artist][:email])
		if artist && artist.authenticate(params[:artist][:password])
			session[:artist_id] = artist.id
			redirect "/artists/#{artist.id}"
		else
			redirect "/login"
		end
	end

	get '/logout' do
		session.clear
		redirect "/"
	end

end