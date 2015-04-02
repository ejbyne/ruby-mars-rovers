class MarsRovers < Sinatra::Base

  def x_axis_length
    @@mission_control.plateau.x_axis_length
  end

  def y_axis_length
    @@mission_control.plateau.y_axis_length
  end

  def grid_rows
    @@mission_control.plateau.split_grid_values_into_rows
  end

end
