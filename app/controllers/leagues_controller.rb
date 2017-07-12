class LeaguesController < ApplicationController

	def new
		@league = League.new
	end
end
