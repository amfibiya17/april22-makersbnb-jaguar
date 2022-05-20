require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require './lib/home'


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
    @homes = Home.all
    erb :selection
  end

  get '/homes' do
    @homes = Home.all
    erb :homes
  end

  post '/homes' do
    session[:home] = Home.select(id: params[:id])
    redirect to '/request'
  end

  get '/request' do
    @home = Home.select(id: params[:id])
    erb :request
  end

  post '/request' do
    @booking = Booking.request 
    redirect to '/profile'
  end

  post '/logout' do
    session[:user] = nil
    redirect to '/login'
  end

  get '/list' do
    @homes = Home.all
    erb :list
  end

  post '/list' do
    Home.create(home_name: params[:home_name], description: params[:description], price: params[:price], owner_id: session[:user].id)
    redirect to '/selection'
  end
  
  get '/profile' do
    erb :profile
  end

  run! if app_file == $0
end
