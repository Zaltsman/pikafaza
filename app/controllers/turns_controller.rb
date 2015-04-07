class TurnsController < ApplicationController
  def create
  	@turn = Turn.new(turn_params)

  	if @turn.save
  		if session[:current_player] == 1
  		   session[:current_player] = 2	
  		else
  			session[:current_player] = 1
  		end
 		redirect_to game_path(@turn.game)
  	end
  end

  def turn_params
    params.require(:turn).permit(:guess, :game_id)
  end
end
