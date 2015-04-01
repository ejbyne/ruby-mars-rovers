require_relative '../app/models/plateau'

describe Plateau do

  let (:plateau) { Plateau.new({ coords: '5 5', cell_class: cell_class }) }
  let (:cell_class) { double :cell_class, new: cell }
  let (:cell) { double :cell }
  let (:rover) { double :rover }

  it 'contains a grid according to the specified coordinates' do
    expect(plateau.grid.count).to eq(36)
  end

  it 'has a cell for each coordinate' do
    plateau.grid.each_value do |value|
      expect(value).to eq(cell)
    end
  end

  it 'allows a rover to be placed on a cell' do
    coords = :'1 2'
    expect(plateau.grid[coords]).to receive(:content=).with(rover)
    plateau.place_rover(coords, rover)
  end

end
