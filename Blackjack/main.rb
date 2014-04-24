require 'rubygems'
require 'sinatra'

set :sessions, true

helpers do
  def total(cards)
    values = cards.map{|card| card[1] }
    total = 0

      values.each do |val|
        if val == 'A'
          total += 11
        else
          total += (val.to_i == 0 ? 10 : val.to_i)
        end
      end

      values.select{|val| val == 'A'}.count.times do
        break if total <= 21
        total -= 10
      end

      total
  end

  def card_image(card)
    suit = card[0]
    value = card[1]

      "<img src= '/images/cards/#{suit}_#{value}.jpg' class='card_image' >"
  end

end

before do
  @show_buttons = true
  @dealer_button = false
  @hidden_card = true
end

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
  if params[:player].empty?
    @error = "Please enter your name."
    halt erb(:new_player)
  end

  session[:player] = params[:player]
  redirect '/bet'
end

get '/bet' do
  erb :bet
end

post '/setbet' do
  session[:bet] = params[:bet]
  redirect '/game'
end

get '/game' do
  # deck
  suits = ['hearts', 'diamonds', 'clubs', 'spades']
  values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace']
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

post '/game/player/hit' do

  session[:player_cards] << session[:deck].pop
  playertotal = total(session[:player_cards])
    if playertotal == 21
      @success = "#{session[:player]} got blackjack and wins!"
      @show_buttons = false
    elsif playertotal > 21
      @error = "#{session[:player]} busted and lost."
      @show_buttons = false
    end
  
  erb :game
  
end

post '/game/player/stay' do
  
  @success = "#{session[:player]} has chosen to stay with a total of #{total(session[:player_cards])}"
  @show_buttons = false
  @dealer_button = true
  redirect '/game/dealer'
  
end

get '/game/dealer' do
  @show_buttons = false

  dealertotal = total(session[:dealer_cards])

  if dealertotal == 21
    @error = "Dealer hit blackjack! #{session[:player]} loses."
    @dealer_button = false
  elsif dealertotal > 21
    @success = "Dealer busted. #{session[:player]} wins!"
    @dealer_button = false
  elsif dealertotal >= 17
    # stays
    redirect '/game/compare'
  else
    # hits
    @dealer_button = true
  end

  erb :game
end

post '/game/dealer/hit' do
  session[:dealer_cards] << session[:deck].pop
  redirect '/game/dealer'
end

get '/game/compare' do
  @show_buttons = false
  playertotal = total(session[:player_cards])
  dealertotal = total(session[:dealer_cards])

  if playertotal < dealertotal
    @error = "Sorry, #{session[:player]} lost with a total of #{playertotal}. Dealer had #{dealertotal}."
  elsif playertotal > dealertotal
    @success = "#{session[:player]} won with a total of #{playertotal}! Dealer had #{dealertotal}."
  else
    @success = "It's a tie! Dealer had #{dealertotal} and #{session[:player]} had #{playertotal}."
  end

  erb :game
end


