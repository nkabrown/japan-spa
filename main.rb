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
  puts "my params are" + params.inspect

  m = Mandrill::API.new 
  email = params[:email]
  name = params[:name]
  message = {  
   :subject=> "Hello from the Japanese Spa Association",  
   :from_name=> "Japan Spa Association",  
   :text=>"Thank you for taking time to discover Japan’s beautiful spas.",  
   :to=>[  
     {  
       :email=> email,
       :name=> name,  
     }  
   ],  
   :html=> "<html><h1>Hi,</h1> <p>thank you for taking time to discover Japan’s beautiful spa’s</p> <p>We will be sending you a brochure to introduce you to all of the relaxing and rejuvenating choices that await you during your visit to Japan.</html>",  
   :from_email=> "nkabrown@gmail.com",  
  }  
  sending = m.messages.send message  
  puts sending  

  redirect '/'
end
