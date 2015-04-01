class MarsRovers < Sinatra::Base

  get '/rover/select' do
    erb :'rover/select'
  end

  post '/rover/select' do
    session[:mission_control].select_rover(params[:position])
    flash[:notice] = "Rover selected in position #{session[:mission_control].rover_position}"
    redirect '/rover/command'
  end

  get '/rover/command' do
    erb :'rover/command'
  end

  post '/rover/command' do
    session[:mission_control].command_rover(params[:commands])
    flash[:notice] = "Rover moved to position #{session[:mission_control].rover_position}"
    redirect '/rover/select'
  end

end
