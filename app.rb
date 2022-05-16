require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    redirect to '/signup'
  end
  
  get '/signup' do
   
  end

  post '/signup' do
  
  end
  
  post '/login' do

  end

  get '/rent_or_list' do
 
  end

  post '/rent_or_list' do

  end

  post '/logout' do
  
  end

  run! if app_file == $0
end
