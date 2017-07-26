class DraftPicksController < ApplicationController
	include LeagueScoped

	def index
		@draft_picks = DraftPick.all.sorted
	end

private
	def service
		@draft_service ||= DraftService.new @league
	end
end
