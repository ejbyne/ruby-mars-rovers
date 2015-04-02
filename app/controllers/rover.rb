class MarsRovers < Sinatra::Base

  get '/rover/select' do
    erb :'rover/select'
  end

  post '/rover/select' do
    begin
      rover_position = session[:mission_control].select_rover(params[:position])
      flash[:notice] = "Rover selected in position #{rover_position}"
      redirect '/rover/command'
    rescue => error_message
      flash[:error] = "#{error_message}"
      redirect '/rover/select'
    end
  end

  get '/rover/command' do
    erb :'rover/command'
  end

  post '/rover/command' do
    begin
      rover_position = session[:mission_control].command_rover(params[:commands])
      flash[:notice] = "Rover moved to position #{rover_position}"
      redirect '/rover/select'
    rescue => error_message
      flash[:error] = "#{error_message}"
      redirect '/rover/select'
    end
  end

end
