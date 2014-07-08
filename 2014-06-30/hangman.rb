require 'sinatra'

$bad_guesses = 0

secret = 'secret'

guessed_letters = []

get '/' do
  @bad_guesses = $bad_guesses
  @guessed_letters = guessed_letters
  @letters = secret.chars
  erb :index

end

post '/take_guess' do
  params.inspect
  params["guess"]
  if not secret.include?(params["guess"]) then
    $bad_guesses = $bad_guesses + 1
  end  
  guessed_letters << params["guess"]
end

