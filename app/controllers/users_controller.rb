class UsersController < ApplicationController

  before_filter :authorize, only: [:show]

	def new
		@user = User.new		
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:info] = 'User successfully created. Please login now.'
			redirect_to new_session_path
		else
			render :new
		end
	end

	def show
		@user = current_user
	end

private

	def user_params
		params.require(:user).permit(:name, :password)
	end
end
