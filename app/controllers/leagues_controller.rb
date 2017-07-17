class LeaguesController < ApplicationController

  before_filter :authorize

	def new
		@league = League.new
	end

	def create
		
	end
end
