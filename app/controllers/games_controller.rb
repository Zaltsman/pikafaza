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
      session[:current_player] = 1
  		redirect_to game_path(@game)  
    else
      render :new
  	end
  end

  def show
    @turn = Turn.new game_id: params[:id]
    @game = Game.find(params[:id])
  end

	private 

  def game_params
  	params.require(:game).permit(:player_1_name, :player_2_name, :player_1_number, :player_2_number)
  end
end
