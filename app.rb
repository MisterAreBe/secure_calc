require 'sinatra'


get '/' do
  erb :index, :layout => :layout
end

post '/calc' do
  erb :calc, :layout => :layout
end