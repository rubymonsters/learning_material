$bad_guesses = 0
$secrets_arry = ['COCONUT', 'POPCORN', 'BOOKSHELF', 'HAMMOCK']
$secret = $secrets_arry.sample
$guessed_letters = []

class HangmanController < ApplicationController
	def index
		@bad_guesses = $bad_guesses
  		@guessed_letters = $guessed_letters
		@letters = $secret.chars
	end

	def take_guess
		@bad_guesses = $bad_guesses
	  	@guessed_letters = $guessed_letters
	  	@letters = $secret.chars
	  	guess = params["guess"].strip.upcase

	  if too_many_letters?(guess)
	    @message = "You can only propose one letter at the time!"
	  elsif no_letter?(guess)
	    @message = "You didn't propose any letter. Try again!"
	  elsif
	    if not $secret.include?(guess) then
	      $bad_guesses = $bad_guesses + 1
	      @message = "Sorry, that was not a good guess. Try again!"
	    else 
	      @message = "Bravo! That letter appears in the secret word. Time for the next letter..." 
	    end  
	    $guessed_letters << guess
	  else
	    $guessed_letters == @letters.include_all?
	      @message = "Great job!"
	  end

	  redirect_to '/'
	  
	end

	def too_many_letters?(guess)
	  guess.length > 1
	end

	def no_letter?(guess)
	  guess.length < 1
	end
end 
