require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

def get_message(user_guess)
  if user_guess.nil?
    return ""
  end
  message = "Your guess was #{user_guess}."
  if user_guess.to_i > (NUMBER + 20)
    message += "Your guess was way too high."
  elsif user_guess.to_i > NUMBER
    message += "Your guess was too high."
  elsif user_guess.to_i < (NUMBER - 20)
    message += "Your guess was way too low."
  elsif user_guess.to_i < NUMBER
    message += "Your guess was too low."
  elsif user_guess.to_i == NUMBER
    message += "You got it!\nThe secret number was #{NUMBER}."
  end
end

get '/' do
  user_guess = params["guess"]
  reply = get_message(user_guess)
  erb :index, :locals => {:reply => reply}
end
