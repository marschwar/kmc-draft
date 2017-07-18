class TeamsController < ApplicationController
	def index
		@teams = Team.all.sorted
	end

	def new
		@team = Team.new
	end

	def show
		@team = current_team
	end

	def create
		@team = Team.new team_params
		if @team.save
			flash[:info] = 'Team angelegt'
			redirect_to teams_path
		else
			render 'new'
		end
	end

private
	def team_params
		params.require(:team).permit(:name)
	end

	def current_team
		@team ||= Team.find(params[:id])
	end
end
