require 'sinatra/base'
require 'sinatra/partial'
require 'rack-flash'
require_relative './models/cell'
require_relative './models/plateau'
require_relative './models/rover'
require_relative './models/mission_control'
require_relative './helpers/application'
require_relative './controllers/application'
require_relative './controllers/plateau'
require_relative './controllers/rover'

class MarsRovers < Sinatra::Base

  register Sinatra::Partial
  use Rack::Flash
  enable :sessions
  set :partial_template_engine, :erb
  set :views, Proc.new { File.join(root, '..', 'views') }
  set :public_folder, Proc.new { File.join(root, '..', '..', 'public') }

  run! if app_file == $0

end
