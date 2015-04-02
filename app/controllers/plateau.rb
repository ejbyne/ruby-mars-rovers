class MarsRovers < Sinatra::Base

  post '/plateau' do
    begin
      plateau = Plateau.new({ max_coords: params[:max_coords], cell_class: Cell })
      @@mission_control = MissionControl.new({ plateau: plateau, rover_class: Rover })
      flash[:notice] = 'Coordinates generated'
      redirect '/rover/select'
    rescue => error_message
      flash[:error] = "#{error_message}"
      redirect '/'
    end
  end

end
