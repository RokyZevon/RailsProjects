class EventsController < ApplicationController

	before_action :set_event, :only => [ :show, :edit, :update, :destroy ]

	def index
		@events = Event.page( params[ :page ] ).per( 5 )

		respond_to do |format|
			format.html # index.html.erb
			format.xml { render xml: @events.to_xml }
			format.json { render json: @events.to_json }
			format.atom { @feed_title = "My event list" } # index.atom.builder
		end
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
		@event = Event.find( params[ :id ] )
		respond_to do | format |
			format.html { @page_title = @event.name } # show.html.erb
			format.xml # show.xml.builder
			format.json { render :json => { id: @event.id, name: @event.name }.to_json }
		end
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

  def latest
    @events = Event.order( "id DESC" ).limit( 3 )
  end


	private

	# 白名单
	def event_params
		params.require( :event ).permit( :name, :description, :category_id, location_attributes: [ :id, :name, :_destroy ], group_ids: [  ] )
	end

	# before_action
	def set_event
		@event = Event.find( params[ :id ] )
	end

end
