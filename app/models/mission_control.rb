class MissionControl

  def initialize(options)
    @plateau = options.fetch(:plateau)
    @rover_class = options.fetch(:rover_class)
  end

  def select_rover(position)
    coords = :"#{position.split(' ')[0]} #{position.split(' ')[1]}"
    orientation = "#{position.split(' ')[2]}"
    rover = @rover_class.new(orientation: orientation)
    @plateau.place_rover(coords, rover)
  end

end
