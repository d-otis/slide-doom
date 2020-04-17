class ArtistsController < ApplicationController
	use Rack::Flash

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
		if artist.save
			flash[:message] = "Account Successfully Created. Please log in."
			redirect '/login'
		else
			flash[:message] = artist.errors.collect {|k,v| "#{k.capitalize} #{v}."}
			redirect "/register"
		end
	end

	patch '/artists/:slug' do
		artist = Artist.find_by_slug(params[:slug])
		artist.update(params[:artist])

		redirect "/artists/#{artist.slug}"
	end
end