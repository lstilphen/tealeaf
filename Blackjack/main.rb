require 'rubygems'
require 'sinatra'

set :sessions, true

get '/' do
  if session[:player]
    redirect '/game'
  else
    redirect '/new_player'
  end
end

get '/new_player' do
  erb :new_player
end

post '/savename' do
  session[:player] = params[:player]
  redirect '/bet'
end

get '/bet' do
  erb :bet
end

post '/setbet' do
  params[:bet]
  redirect '/game'
end

get '/game' do
  # deck
  suits = ['H', 'D', 'C', 'S']
  values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  session[:deck] = suits.product(values).shuffle!
  # deal cards
  session[:dealer_cards] = []
  session[:player_cards] = []
  session[:dealer_cards] << session[:deck].pop
  session[:player_cards] << session[:deck].pop
  session[:dealer_cards] << session[:deck].pop
  session[:player_cards] << session[:deck].pop
  erb :game
end

post '/hit' do
  # playertotal = 

  session[:player_cards] << session[:deck].pop
    # if playertotal == 21
      #"Blackjack!" end game
    # elsif playertotal > 22
      # "Busted." end game
    # else
      # carry on
    # end
    
  erb :game
end

post '/stay' do
  # begin dealer turn
  erb :game
end



