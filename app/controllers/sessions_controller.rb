class SessionsController < ApplicationController
	def index
		if current_user
			redirect_to user_path(current_user)
		end
	end

	def new
		@name = ''
	end

	def create
		user = User.find_by_name(params[:name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			flash[:error] = 'Unbekannter Benutzer oder Passwort falsch.'
			@name = params[:name]
			render 'new'
		end
	end

	def destroy
	  session.clear
	  redirect_to root_path
	end

private

end
