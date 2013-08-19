class Api::V1::OperationsController < ApplicationController
  def index
  	@ops = Operation.top_level
  	render :json => @ops.to_json({
  			:include => [ :tags, :links ]
  		})
  end

  def show
  	@op ||= Operation.find_by_url(params[:id]) || Operation.find(params[:id])
  	render :json => @op.to_json({
  			:include => [ :tags, :links, :children ]
  		})
  end

  def create
  	# [TODO] implement recursive operation creation station
  end

  def full_map
  	@op ||= Operation.find_by_url(params[:id]) || Operation.find(params[:id])
  	render :json => @op.full_map
  end
end
