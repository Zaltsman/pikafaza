class Turn < ActiveRecord::Base
  belongs_to :game

  def score
	number_chars = game.player_1_number.to_s.chars
	guess_chars = guess.to_s.chars

	pikas = []
	not_pikas = []

	number_chars.each_with_index do |n, index|
	  if n == guess_chars[index]
	    pikas << n
	  else
	    not_pikas << n
	  end
	end

	potential_fazas_in_number = number_chars - pikas
	potential_fazas_in_guess = guess_chars - pikas

	fazas = potential_fazas_in_guess & potential_fazas_in_number

	[pikas, fazas]
  end
end
