require 'sinatra/base'
require_relative './models/cell'
require_relative './models/plateau'
require_relative './models/rover'
require_relative './models/mission_control'

class MarsRovers < Sinatra::Base

  set :views, Proc.new { File.join(root, 'views') }
  set :public_folder, Proc.new { File.join(root, '..', 'public') }
  enable :sessions

  get '/' do
    erb :index
  end

  post '/plateau' do
    session[:plateau] = Plateau.new({ coords: params[:coords], cell_class: Cell })
    session[:mission_control] = MissionControl.new({ plateau: session[:plateau], rover_class: Rover })
    redirect '/select_rover'
  end

  get '/select_rover' do
    erb :select_rover
  end

  post '/select_rover' do
    session[:mission_control].select_rover(params[:position])
    session[:position] = params[:position]
    redirect '/move_rover'
  end

  get '/move_rover' do
    @position = session[:position]
    erb :move_rover
  end

  post '/move_rover' do
    session[:mission_control].move_rover(params[:command])
    puts session[:plateau].grid
    redirect_to '/select_rover'
  end

  run! if app_file == $0

end
