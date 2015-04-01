require 'sinatra/base'
require_relative './models/cell'
require_relative './models/plateau'

class MarsRovers < Sinatra::Base

  set :views, Proc.new { File.join(root, 'views') }
  set :public_folder, Proc.new { File.join(root, '..', 'public') }
  enable :sessions

  get '/' do
    erb :index
  end

  post '/plateau' do
    coords = params[:coords]
    session[:plateau] = Plateau.new({ coords: coords, cell_class: Cell })
    redirect '/select_rover'
  end

  get '/select_rover' do
    erb :select_rover
  end

  post '/select_rover' do
    command = params[:command]
    redirect '/move_rover'
  end

  get '/move_rover' do
    erb :move_rover
  end

  run! if app_file == $0
  
end
