require_relative "../models/concerns/slugify"

class ApplicationController < Sinatra::Base
	use Rack::Flash
	register Sinatra::ActiveRecordExtension

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
			!!current_user
		end

		def current_user
			@current_user ||= Artist.find(session[:artist_id]) if session[:artist_id]
		end

		def login(email, password)
			artist = Artist.find_by(email: email)
			if artist && artist.authenticate(password)
				session[:artist_id] = artist.id
				redirect "/artists/#{artist.slug}"
			else
				redirect "/login"
			end
		end

		def logout
			session.clear
			redirect "/"
		end

		def artist_errors(artist)
			artist.errors.collect {|k,v| "#{k.capitalize} #{v}."}
		end
	end

end