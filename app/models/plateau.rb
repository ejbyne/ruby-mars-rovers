class Plateau

  attr_reader :grid

  def initialize(options)
    coords = options.fetch(:coords)
    cell_class = options.fetch(:cell_class)
    @grid = create_grid(coords, cell_class)
  end

  def place_rover(coords, rover)
    grid[coords].content = rover
  end

  def move_rover(start_coords, end_coords, rover)
    grid[start_coords].content = nil
    grid[end_coords].content = rover
  end

  private
    
  def create_grid(coords, cell_class)
    (0..coords.split(' ')[0].to_i).map do |x_coord|
      (0..coords.split(' ')[1].to_i).map do |y_coord|
        { "#{x_coord} #{y_coord}".to_sym => cell_class.new }
      end
    end.flatten.inject(:merge)
  end

end
