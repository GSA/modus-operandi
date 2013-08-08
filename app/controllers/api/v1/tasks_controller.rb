class Api::V1::TasksController < ApplicationController
	def index
		@tasks = Task.find_all_by_section_id(params[:section_id])
		render :json => @tasks.to_json({
				:include => [ :tags, :links ]
			})
	end

	def show
		@tasks = Task.find_all_by_id(params[:id])
		render :json => @tasks.to_json(
			{
				:include => [ :tags, :links ]
			})
	end
end
