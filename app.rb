require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    redirect to '/signup'
  end
  
  get '/signup' do
   erb :signup
  end

  post '/signup' do
    user = User.create(username: params[:username], password: params[:password], email: params[:email])
    session[:user] = user
    redirect to '/selection'
  end
  
  get '/login' do
    erb :login
  end
  
  post '/login' do
    user = User.login_find(username: params[:username], password: params[:password])
    session[:user] = user
    redirect to '/selection'
  end

  get '/selection' do
    erb :selection
  end

  # post '/selection' do
   
  # end

  get '/homes' do
    @homes = Home.all
    erb :homes
  end

  post '/homes' do
    @home = Home.select[name: params[:name], price: params[:price], description: params[:description]]
    redirect to '/request'
  end

  get '/request' do
    @home = session[:home]
    erb :request
  end

  post '/request' do
    session[:user] = user
    @booking = Booking.request 
    redirect to '/profile'
  end

  post '/logout' do
    p session[:user] = nil
    redirect to '/login'
  end

  get '/list' do
    erb :list
  end

  post '/list' do
    redirect to '/selection'
  end
  
  get '/profile' do
    erb :profile
  end

  run! if app_file == $0
end
