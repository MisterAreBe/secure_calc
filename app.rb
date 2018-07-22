require 'sinatra'
require_relative 'calc.rb'

enable :sessions

get '/' do

  erb :index, :layout => :layout
end

post '/login' do
  
redirect '/calc'
end

get '/calc' do
  math = session[:screen] || ''

  erb :calc, :layout => :layout, locals: {math: math}
end

post '/math' do
  x = params[:x]
  y = params[:y]
  z = params[:z]
  math = calc(x, y, z)
  session[:screen] = math
  p session[:screen]
  redirect '/calc'
end