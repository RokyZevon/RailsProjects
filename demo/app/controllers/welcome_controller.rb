class WelcomeController < ApplicationController

  before_action :authenticate_user!

	def say
	end

	def index
	end
end
