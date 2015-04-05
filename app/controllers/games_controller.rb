class GamesController < ApplicationController
	before_action :authenticate_user!

  def index
  	@games = current_user.games 
  end

  def new
  	@game = Game.new
  end

  def create
  	# @game = Game.new(game_params)
  	# @game.user = current_user

	@game = current_user.games.build(game_params)

  	if @game.save
  		redirect_to games_path
  	else
  		render :new
  	end
  end

	private 

  def game_params
  	params.require(:game).permit(:player_1_name, :player_2_name)
  end

end
