require 'sinatra/base'

class MarsRovers < Sinatra::Base
  get '/' do
    'Hello MarsRovers!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
