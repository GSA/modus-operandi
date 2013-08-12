class Api::V1::SectionsController < ApplicationController
	def index
		@sections = Section.find_all_by_registration_id(params[:registration_id])
		render :json => @sections.to_json({
				:include => [ :tasks, :tags, :links ]
			})
	end

	def show
		@section = Section.find(params[:id])
		render :json => @section.to_json(
			{
				:include => [ :tasks, :tags, :links ]
			})
	end

	def full_map
		@section = Section.find_by_id(params[:id])
		render :json => @section.full_map
	end
end