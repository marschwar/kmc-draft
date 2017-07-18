class LeaguesController < ApplicationController

  before_filter :authorize

  def index
  	@leagues = League.all
  end

	def new
		@league = League.new
	end

	def create
		@league = League.new league_params
		@league.user = current_user
		if @league.save
			flash[:info] = 'Liga erfolgreich angelegt'
			redirect_to leagues_path
		else
			render 'new'
		end
	end

	def show
		@league = League.find params[:id]
	end

private

	def league_params
		params.require(:league).permit(:name)
	end
end
