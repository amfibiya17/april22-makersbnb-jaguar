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
    redirect to '/selection'
  end
  
  # get '/login' do

  # end

  # post '/login' do

  # end

  get '/selection' do
    erb :selection
  end

  post '/selection' do
    
  end
  
  # get '/list' do
    
  # end
  
  # post '/list' do
  #   redirect to '/selection'
  # end
  
  get '/homes' do
    erb :homes
  end

  get '/request' do
    erb :request
  end
  # post '/logout' do
  
  # end

  run! if app_file == $0
end
