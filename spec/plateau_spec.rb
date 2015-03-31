require_relative '../app/models/plateau'

describe Plateau do

  let (:cell) { double :cell }
  let (:cell_class) { double :cell_class, new: cell }
  let (:plateau) { Plateau.new({ coords: '5 5', cell_class: cell_class }) }

  it 'contains a grid according to the specified coordinates' do
    expect(plateau.grid.count).to eq(36)
  end

  it 'has a cell for each coordinate' do
    plateau.grid.each_value do |value|
      expect(value).to eq(cell)
    end
  end

end
