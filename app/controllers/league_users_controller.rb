class LeagueUsersController < ApplicationController
	include LeagueScoped
	
	def index
		user_name = flash[:user_to_add]
		@league_user = LeagueUser.new
		@league_users = @league.users.sorted
	end

	def create
		user_name = add_user_params[:user][:name]
		user = User.find_by_name user_name if user_name
		if user
			if @league.users.include?(user)
				flash[:error] = "#{user_name} ist bereits in der Liga"
			else
				@league.users.push user
				if @league.save
					flash[:info] = "#{user.name} hinzugefügt"
				end
			end
		else
			flash[:error] = "#{user_name} ist nicht bekannt"
		end
		redirect_to league_users_path(@league)
	end

private 

	def add_user_params
		params.require(:league_user).permit(user: [:name])
	end
end
