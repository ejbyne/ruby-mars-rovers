require_relative '../app/models/cell'

describe Cell do

  let (:cell) { Cell.new }

  it 'is initiated with nil content' do
    expect(cell.content).to be(nil)
  end

end
