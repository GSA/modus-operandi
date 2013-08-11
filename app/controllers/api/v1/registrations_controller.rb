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

	def full_map
		# @registration = Registration.where('ID = ?',params[:id]).joins(:sections)
		@registration = Registration.includes(:sections).includes(:links).includes(:tags).where(:id => params[:id])
		@json = @registration.first.attributes
		@json[:sections] = []
		@json[:tags] = []
		@json[:links] = []
		@json[:tags] << @registration.first.tag_list unless @registration.first.tag_list.empty?
		@json[:links] = @registration.first.links unless @registration.first.links.empty?
		@registration.first.sections.each do |section|
			sec_hash = section.attributes
			sec_hash[:tags] = []
			sec_hash[:links] = []
			# sec_hash[:tasks] = section.tasks unless section.tasks.empty?
			sec_hash[:tasks] = []
			sec_hash[:tags] << section.tags.attributes unless section.tags.empty?
			sec_hash[:links] << section.links.attributes unless section.links.empty?
			section.tasks.each do |task|
				# sec_hash[:tasks] << task.attributes
				task_hash = task.attributes
				task_hash[:links] = []
				task_hash[:tags] = []
				task_hash[:links] = task.links unless task.links.empty?
				task_hash[:tags] = task.tags unless task.tags.empty?
				sec_hash[:tasks] << task_hash
			end
			@json[:sections] << sec_hash
		end
		render :json => @json
	end
end
