class PlayersController < ApplicationController

	def new
	end

	def create
		@player = Player.new(player_params)
		@player.experience = 0
		@player.save
		redirect_to @player
	end

	def show
		@player = Player.find(params[:id])
	end

	private
	
	def player_params
		params.require(:player).permit(:username, :password, :email, :password_confirmation)
	end

end
