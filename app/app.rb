require 'sinatra/base'
require 'rack-flash'
require_relative './models/cell'
require_relative './models/plateau'
require_relative './models/rover'
require_relative './models/mission_control'

class MarsRovers < Sinatra::Base

  set :views, Proc.new { File.join(root, 'views') }
  set :public_folder, Proc.new { File.join(root, '..', 'public') }
  enable :sessions
  use Rack::Flash

  get '/' do
    erb :index
  end

  post '/plateau' do
    plateau = Plateau.new({ coords: params[:coords], cell_class: Cell })
    session[:mission_control] = MissionControl.new({ plateau: plateau, rover_class: Rover })
    flash[:notice] = 'Coordinates generated'
    redirect '/select_rover'
  end

  get '/select_rover' do
    erb :select_rover
  end

  post '/select_rover' do
    session[:mission_control].select_rover(params[:position])
    flash[:notice] = "Rover selected in position #{session[:mission_control].rover_position}"
    redirect '/command_rover'
  end

  get '/command_rover' do
    erb :command_rover
  end

  post '/command_rover' do
    session[:mission_control].command_rover(params[:commands])
    flash[:notice] = "Rover moved to position #{session[:mission_control].rover_position}"
    redirect '/select_rover'
  end

  run! if app_file == $0

end
