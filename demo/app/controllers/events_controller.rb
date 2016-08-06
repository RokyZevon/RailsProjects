class EventsController < ApplicationController

	before_action :set_event, :only => [ :show, :edit, :update, :destroy ]

	def index
		@events = Event.page( params[ :page ] ).per( 5 )
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new( event_params )
		if @event.save
			redirect_to events_path 

			flash[ :notice ] = "创建成功"
		else
			render :action => :new
		end
	end

	def show
		@page_title = @event.name
	end

	def edit
	end

	def update
		if @event.update( event_params )
			redirect_to event_path( @event )

			flash[ :notice ] = "修改成功"
		else
			render :action => :edit
		end
	end

	def destroy
		@event.destroy

		redirect_to :action => :index

		flash[ :alter ] = "删除成功"
	end


	private
	
	# 白名单
	def event_params
		params.require( :event ).permit( :name, :description )
	end

	# before_action
	def set_event
		@event = Event.find( params[ :id ] )
	end

end
