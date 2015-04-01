require_relative '../app/models/cell'

describe Cell do

  let (:cell) { Cell.new }
  let (:rover) { double :rover }

  it 'is initialized with nil content' do
    expect(cell.content).to be(nil)
  end

  it 'allows a rover to be placed on it' do
    cell.content = rover
    expect(cell.content).to be(rover)
  end

end
