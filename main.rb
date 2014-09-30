require 'sinatra'
require 'mandrill'

get '/' do 
	erb :index
end

get '/info' do
	erb :info
end

get '/map' do
	erb :map
end

get '/contact' do
	erb :contact
end

post '/contact' do 
  name = params[:name]
  email = params[:email]

  
end