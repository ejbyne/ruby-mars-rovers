require_relative '../app/models/cell'

describe Cell do

  let (:cell) { Cell.new }
  let (:rover) { double :rover }

  context 'initializing the cell' do
  
    it 'is initialized with nil content' do
      expect(cell.content).to be(nil)
    end

  end

  context 'placing a rover on the cell' do

    it 'allows a rover to be placed on it' do
      cell.content = rover
      expect(cell.content).to be(rover)
    end

  end

end
