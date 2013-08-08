class Api::V1::SectionsController < ApplicationController
	def index
		@sections = Section.find_all_by_registration_id(params[:registration_id])
		render :json => @sections.to_json({
				:include => [ :tasks, :tags, :links ]
			})
	end

	def show
		@sections = Section.find_all_by_id(params[:id])
		render :json => @sections.to_json(
			{
				:include => [ :tasks, :tags, :links ]
			})
	end
end