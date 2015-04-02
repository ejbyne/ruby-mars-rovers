require_relative '../app/models/plateau'

describe Plateau do

    let(:plateau)    { Plateau.new({ max_coords: '5 5', cell_class: cell_class }) }
    let(:cell_class) { double :cell_class, new: cell }
    let(:cell)       { double :cell }
    let(:rover)      { double :rover }

  context 'creating a grid' do

    it 'does not allow missing or invalid coordinates' do
      expect{ Plateau.new({ max_coords: '', cell_class: cell_class }) }.to raise_error('Invalid coordinates')
      expect{ Plateau.new({ max_coords: '55', cell_class: cell_class }) }.to raise_error('Invalid coordinates')
    end

    it 'contains a grid according to the specified coordinates' do
      expect(plateau.grid.count).to eq(36)
    end

    it 'has a cell for each coordinate' do
      plateau.grid.each_value do |value|
        expect(value).to eq(cell)
      end
    end

    it 'knows the lengths of the x and y axes' do
      expect(plateau.x_axis_length).to eq(6)
      expect(plateau.y_axis_length).to eq(6)
    end

    it 'can split the grid values into rows' do
      expect(plateau.split_grid_values_into_rows.length).to eq(6)
    end

  end

  context 'placing rovers on the plateau' do

    it 'allows a rover to be placed on a cell' do
      coords = :'1 2'
      expect(plateau.grid[coords]).to receive(:content=).with(rover)
      plateau.place_rover(coords, rover)
    end

    it 'raises an error if the selected cell does not exist' do
      expect{ plateau.place_rover(:'1 6', rover) }.to raise_error('Invalid coordinates')
    end

  end

  context 'moving rovers on the plateau' do

    it 'allows a rover to be moved to a different cell' do
      start_coords = :'1 2'
      end_coords = :'1 3'
      expect(plateau.grid[end_coords]).to receive(:content)
      expect(plateau.grid[start_coords]).to receive(:content=).with(nil)
      expect(plateau.grid[end_coords]).to receive(:content=).with(rover)
      plateau.move_rover(start_coords, end_coords, rover)
    end

    it 'raises an error if the rover tries to move outside the plateau' do
      expect{ plateau.move_rover(:'1 5', :'1 6', rover) }.to raise_error('Cannot ' +
        'move rover outside plateau. Rover stopped at coordinates 1 5')
    end

    it 'raises an error if the rover tries to move onto a cell occupied by another rover' do
      end_coords = :'1 3'
      allow(plateau.grid[end_coords]).to receive(:content).and_return(rover)
      expect{ plateau.move_rover(:'1 2', end_coords, rover) }.to raise_error('Cannot move ' +
        'rover onto cell occupied by another rover. Rover stopped at coordinates 1 2')
    end

  end

end
