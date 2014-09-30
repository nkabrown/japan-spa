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

#post '/:email/:name/contact' do 
  # m = Mandrill::API.new
  # message = {
  #   :subject=> "Request for Relaxation Information"
  #   :from_name=> "Web Automated",
  #   :text=> "Please send " + params[:from_name] + " the Japan Spa packages brochure at " + params[:from_email] + ".",    
  #   :to=>[
  #     {
  #     :email=> "nkabrown@gmail.com",
  #     :name=> "Nathan",
  #     }
  #   ],
  #   :html=> "<html><h1>New Request</h1><br><p>Please send " + params[:from_name] + " the Japan Spa packges brochure at " + params[:from_email] + ".</p></html>",
  #   :from_email=> "Web Automated",
  # }
#   sending = m.messages.send message
#   puts "params are " + params.inspect
#   redirect '/'
# end