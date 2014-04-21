require 'rubygems'
require 'sinatra'

set :sessions, true

get '/' do
  erb :new_game
end

post '/savename' do
  params['username']
end

