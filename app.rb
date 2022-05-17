require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  enable :sessions

  # get '/' do
  #   redirect to '/signup'
  # end
  
  # get '/signup' do
   
  # end

  # post '/signup' do
  
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
