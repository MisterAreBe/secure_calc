require 'sinatra'
require_relative 'calc.rb'

enable :sessions

get '/' do

  erb :index, :layout => :layout, locals: {err_msg: ''}
end

post '/login' do
first_name = params[:first_name]
last_name = params[:last_name]
user_name = params[:user_name]
password = params[:password]



valid_name = ENV['username'].split(' ')
valid_pwd = ENV['password'].split(' ')

if valid_name.include?(user_name)
  if valid_pwd.include?(password)
    if valid_name.index(user_name) == valid_pwd.index(password)
      redirect '/calc'
    else
      erb :index, :layout => :layout, locals: {err_msg: 'Username and Password do not match'}
    end
  else
    erb :index, :layout => :layout, locals: {err_msg: 'Invalid Password'}
  end
elsif valid_pwd.include?(password)
  erb :index, :layout => :layout, locals: {err_msg: 'Invalid Username'}
end
end

get '/calc' do
  math = session[:screen] || ''
  first_name = session[:first_name]
  last_name = session[:last_name]
  user_name = session[:user_name]
  erb :calc, :layout => :layout, locals: {math: math, first_name: first_name, last_name: last_name, user_name: user_name}
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