class Plateau

  attr_reader :grid

  def initialize(options)
    set_max_coords_if_valid(options.fetch(:max_coords))
    @grid = create_grid(options.fetch(:cell_class))
  end

  def place_rover(coords, rover)
    valid_place_coords?(coords)
    grid[coords].content = rover
  end

  def move_rover(start_coords, end_coords, rover)
    valid_move_coords?(start_coords, end_coords)
    grid[start_coords].content = nil
    grid[end_coords].content = rover
  end

  def x_axis_length
    @max_coords.split(' ')[0].to_i + 1
  end

  def y_axis_length
    @max_coords.split(' ')[1].to_i + 1
  end

  def split_grid_values_into_rows
    grid.values.each_slice(y_axis_length).to_a.transpose
  end

  private

  def set_max_coords_if_valid(max_coords)
    raise 'Invalid coordinates' unless max_coords =~ /^\d+\s\d+$/
    @max_coords = max_coords
  end

  def create_grid(cell_class)
    (0...x_axis_length).map do |x|
      (0...y_axis_length).map do |y|
        { "#{x} #{y}".to_sym => cell_class.new }
      end
    end.flatten.inject(:merge)
  end

  def valid_place_coords?(coords)
    raise 'Invalid coordinates' unless grid.has_key?(coords)
  end

  def valid_move_coords?(start_coords, end_coords)
    raise "Cannot move rover outside plateau. Rover stopped at coordinates " +
     "#{start_coords}" unless grid.has_key?(end_coords)
    raise "Cannot move rover onto cell occupied by another rover. Rover stopped " +
    "at coordinates #{start_coords}" unless grid[end_coords].content == nil
  end

end
