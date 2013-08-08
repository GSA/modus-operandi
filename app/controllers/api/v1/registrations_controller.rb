class Api::V1::RegistrationsController < ApplicationController
	def index
		@registrations = Registration.all(:include => :tags)
		render :json => @registrations.to_json({
				:include => [ :tags, :links ]
			})
	end

	def show
		@registration = Registration.find(params[:id])
		render :json => @registration.to_json(
			{
				:include => [ :sections, :tags, :links ]
			})
	end

	def create
		Registration.create(:name => params[:name])
	end
end
