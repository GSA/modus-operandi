class Api::V1::OperationsController < ApplicationController
  before_filter :allow_cross_origin
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

  def allow_cross_origin
    response.headers["Access-Control-Allow-Origin"]="*"
  end
end
