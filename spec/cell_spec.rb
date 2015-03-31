require_relative '../app/models/cell'

describe Cell do

  let (:cell) { Cell.new }

  it 'is initialized with nil content' do
    expect(cell.content).to be(nil)
  end

end
