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

  post '/selection' do
    
  end

  
  get '/homes' do
    erb :homes
  end

  get '/request' do
    erb :request
  end

  # post '/logout' do
    # session[:user] = nil
    # redirect to '/login'
  # end

  get '/list' do
    erb :list
  end

  post '/list' do
    redirect to '/selection'
  end


  run! if app_file == $0
end
