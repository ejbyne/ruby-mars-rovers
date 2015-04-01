class Rover

  attr_reader :orientation

  def initialize(options)
    @orientation = options.fetch(:orientation)
    @orientation_options = ['N', 'E', 'S', 'W']
    @orientation_index = @orientation_options.index(@orientation)
  end

  def turn(direction)
    @orientation_options.rotate!(-1) if direction == 'L'
    @orientation_options.rotate! if direction == 'R'
    @orientation = @orientation_options[@orientation_index]
  end

end
