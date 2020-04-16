class InstitutionsController < ApplicationController


	get "/institutions" do
		@institutions = Institution.all

		erb :'/institutions/index'
	end

	get "/institutions/:id" do
		@institution = Institution.find(params[:id])

		erb :'/institutions/show'
	end

end