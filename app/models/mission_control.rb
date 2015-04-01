class MissionControl

  def initialize(options)
    @plateau = options.fetch(:plateau)
    @rover_class = options.fetch(:rover_class)
  end

  def select_rover(command)
    coords = :"#{command.split(' ')[0]} #{command.split(' ')[1]}"
    orientation = "#{command.split(' ')[2]}"
    rover = @rover_class.new(orientation)
    @plateau.place_rover(rover, coords)
  end

end
