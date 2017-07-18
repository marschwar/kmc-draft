class PlayersController < ApplicationController
	include LeagueScoped

	before_action :set_player, only: [:show, :edit, :update, :destroy]
	before_action :load_teams, only: [:new, :edit]

	def index
		@players = Player.of_league(@league)
	end

	def new
		@player = Player.new
	end

	def create
		@player = Player.new player_params
		@player.league = @league
		if @player.save
			flash[:info] = 'Spieler erstellt'
			redirect_to league_players_path(@league)
		else
			render 'new'
		end
	end

	def show
	end

	def edit
		
	end

	def update
		@player.update_attributes player_params
		@player.league = @league
		if @player.save
			flash[:info] = 'Spieler aktualisiert'
			redirect_to league_players_path(@league)
		else
			render 'edit'
		end
	end

private 

	def player_params
		params.require(:player).permit(:name, :position, :team_id, :grade, :games_played, :goals, :assists, :allstar_team)
	end

	def set_player
		@player = Player.find params[:id]
	end

	def load_teams
		@teams = Team.all.sorted
	end
end
