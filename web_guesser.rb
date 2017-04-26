require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)
background_color = 'white'

def get_message(user_guess)
  if user_guess.nil?
    return ""
  end
  message = "Your guess was #{user_guess}."
  if user_guess.to_i > (NUMBER + 20)
    message += " A fire of 1000 suns hot."
  elsif user_guess.to_i > NUMBER
    message += " Hot."
  elsif user_guess.to_i < (NUMBER - 20)
    message += " Freezing Cold."
  elsif user_guess.to_i < NUMBER
    message += " Cold."
  elsif user_guess.to_i == NUMBER
    message += " Goldilocks loves you!\nThe random number was #{NUMBER}."
  end
end

def get_background_color(user_guess)
  if user_guess.nil?
    return "white"
  end
  if user_guess.to_i > (NUMBER + 20)
    return "red"
  elsif user_guess.to_i > NUMBER
    return "orange"
  elsif user_guess.to_i < (NUMBER - 20)
    return "blue"
  elsif user_guess.to_i < NUMBER
    return "lavendar"
  elsif user_guess.to_i == NUMBER
    return "yellow"
  end
end

get '/' do
  user_guess = params["guess"]
  reply = get_message(user_guess)
  background_color = get_background_color(user_guess)
  erb :index, :locals => {:reply => reply, :background_color => background_color}
end
