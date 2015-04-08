class TurnsController < ApplicationController

  def create
  	@turn = Turn.create(turn_params)
 		
	if session[:current_player] == 2 
	    if @turn.guess == @turn.game.player_1_number
	    	redirect_to games_path, notice: "#{@turn.game.player_2_name} has won!"
	    	return
	    else
	    	@number_chars = @turn.game.player_1_number.to_s.chars
			@guess_chars = @turn.guess.to_s.chars

				@pikas = []
				@not_pikas = []

				@number_chars.each_with_index do |n, index|
				  if n == @guess_chars[index]
				    @pikas << n
				  else
				    @not_pikas << n
				  end
				end

			@potential_fazas_in_number = @number_chars - @pikas
			@potential_fazas_in_guess = @guess_chars - @pikas

				@fazas =  @potential_fazas_in_guess & @potential_fazas_in_number
				redirect_to game_path(@turn.game), notice: "#{@turn.game.player_2_name} got #{@pikas.length} Pikas and #{@fazas.length} Fazas."
	    	return
	    end

	else 
		if @turn.guess == @turn.game.player_2_number
	    	redirect_to games_path, notice: "#{@turn.game.player_1_name} has won!"
	    	return
	    else
	    	@number_chars = @turn.game.player_1_number.to_s.chars
			@guess_chars = @turn.guess.to_s.chars

				@pikas = []
				@not_pikas = []

				@number_chars.each_with_index do |n, index|
				  if n == @guess_chars[index]
				    @pikas << n
				  else
				    @not_pikas << n
				  end
				end

			@potential_fazas_in_number = @number_chars - @pikas
			@potential_fazas_in_guess = @guess_chars - @pikas

				@fazas =  @potential_fazas_in_guess & @potential_fazas_in_number
				redirect_to game_path(@turn.game), notice: "#{@turn.game.player_1_name} got #{@pikas.length} Pikas and #{@fazas.length} Fazas."
	    	return
	    end
  	end
	 

 # 	if @turn.save
 # 		if session[:current_player] == 2
 # 		   session[:current_player] = 1	
 # 		else
 # 			session[:current_player] = 2
  #		end
 	#	redirect_to game_path(@turn.game)
  	#end
  end

  def turn_params
    params.require(:turn).permit(:guess, :game_id)
  end
end
