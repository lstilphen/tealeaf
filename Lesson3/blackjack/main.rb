require 'rubygems'
require 'sinatra'

set :sessions, true

get '/' do
  "Hello!"
end

get '/template' do
  erb :template
end

get '/nested' do
  erb :"/nested/nestedin"
end

