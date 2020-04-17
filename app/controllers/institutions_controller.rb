class InstitutionsController < ApplicationController


	get "/institutions" do
		@institutions = Institution.all

		erb :'/institutions/index'
	end

	get "/institutions/:slug" do
		@institution = Institution.find_by_slug(params[:slug])

		erb :'/institutions/show'
	end

end