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
   :html=> "<html><h1>Hi " + name + ".</h1> <p style='font-size:20px;'>Thank you for taking the time to discover Japan’s beautiful spa’s.</p><p style='font-size:20px'>We will be sending you a brochure to introduce you to all of the relaxing and rejuvenating choices that await you during your visit to Japan.</p><img src='https://lh5.googleusercontent.com/RjowMrsP6VbfI5ztvxU3HzCJHiaCJJRMDC-R-PknQe8=w1902-h696-no' alt='waves'></html>",  
   :from_email=> "nkabrown@gmail.com",  
  }  
  sending = m.messages.send message  
  puts sending  
  redirect '/'
end
