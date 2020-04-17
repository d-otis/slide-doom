class SessionsController < ApplicationController

	get '/login' do

		erb :'sessions/login'
	end

	post '/login' do
		login(params[:artist][:email], params[:artist][:password])
	end

	get '/logout' do
		session.clear
		redirect "/"
	end

end