class Rover

  attr_reader :orientation

  def initialize(options)
    @orientation = options.fetch(:orientation)
  end

end
