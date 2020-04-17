class ApplicationController < Sinatra::Base

	configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "super_secrets"
	end

	get '/' do
		erb :index
	end

	helpers do
		def logged_in?
			!!session[:artist_id]
		end

		def current_user
			Artist.find(session[:artist_id])
		end
	end

end