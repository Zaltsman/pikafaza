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
  		redirect_to game_path(@game)
  	else
  		render :new
  	end
  end

  def show
    @turn = Turn.new
  end

  def create

  @turn = current_user.turns.build(turn_params)

    if @turn.save
      redirect_to turns_path(id: @turn.id)
      else 
        render :new
      end
    end

	private 

  def game_params
  	params.require(:game).permit(:player_1_name, :player_2_name, :player_1_number, :player_2_number)
  end

  def turn_params
    params.require(:turn).permit(:guess)
  end

end
