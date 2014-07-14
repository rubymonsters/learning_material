$bad_guesses = 0
$secret = 'secret'
$guessed_letters = []

class HangmanController < ApplicationController
	def index
		@bad_guesses = $bad_guesses
		@guessed_letters = $guessed_letters
		@letters = $secret.chars
	end

	def take_guess
		if not $secret.include?(params["guess"]) then
    	$bad_guesses = $bad_guesses + 1
  	end  
  	$guessed_letters << params["guess"]
  	redirect_to '/'
  end	
end

