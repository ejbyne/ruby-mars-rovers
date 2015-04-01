class MarsRovers < Sinatra::Base

  post '/plateau' do
    plateau = Plateau.new({ coords: params[:coords], cell_class: Cell })
    session[:mission_control] = MissionControl.new({ plateau: plateau, rover_class: Rover })
    flash[:notice] = 'Coordinates generated'
    redirect '/rover/select'
  end

end
