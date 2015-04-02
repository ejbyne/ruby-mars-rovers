class MissionControl

  attr_reader :rover_position

  def initialize(options)
    @plateau = options.fetch(:plateau)
    @rover_class = options.fetch(:rover_class)
  end

  def select_rover(position)
    valid_position?(position)
    @rover_coords = :"#{position.split(' ')[0]} #{position.split(' ')[1]}"
    @rover = @rover_class.new(orientation: "#{position.split(' ')[2]}")
    @plateau.place_rover(@rover_coords, @rover)
  end

  def command_rover(commands)
    commands.chars.each do |command|
      turn_rover(command) if turn_command?(command)
      move_rover if move_command?(command)
    end
  end

  def rover_position
    "#{@rover_coords} #{@rover.orientation}"
  end

  private

  def valid_position?(position)
    raise 'Invalid position' unless position =~ /^\d+\s\d+\s[NESW]$/
  end

  def turn_rover(command)
    @rover.turn(command)
  end
    
  def move_rover
    @new_rover_coords = find_new_rover_coords
    @plateau.move_rover(@rover_coords, @new_rover_coords, @rover)
    @rover_coords = @new_rover_coords
  end

  def turn_command?(command)
    ['L', 'R'].include?(command)
  end

  def move_command?(command)
    command == 'M'
  end

  def find_new_rover_coords
    x, y = separate_rover_coords
    return :"#{x} #{y + 1}" if @rover.orientation == 'N'
    return :"#{x + 1} #{y}" if @rover.orientation == 'E'
    return :"#{x} #{y - 1}" if @rover.orientation == 'S'
    return :"#{x - 1} #{y}" if @rover.orientation == 'W'
  end

  def separate_rover_coords
    return @rover_coords.to_s.split(' ')[0].to_i, @rover_coords.to_s.split(' ')[1].to_i
  end

end
