class SessionsController < ApplicationController

	get '/login' do
		if !logged_in?
			erb :'sessions/login'
		else
			redirect "/artists/#{current_user.slug}"
		end
	end

	post '/login' do
		if !logged_in?
			login(params[:artist][:email], params[:artist][:password])
		else
			redirect "/login"
		end
	end

	get '/logout' do
		if logged_in?
			logout
			redirect "/"
		else
			redirect "/login"
		end
	end

end