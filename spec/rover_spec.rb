require_relative '../app/models/rover'

describe Rover do

  let (:rover) { Rover.new({ orientation: 'N' }) }

  it 'is initialized with an orientation' do
    expect(rover.orientation).to eq('N')
  end

end
