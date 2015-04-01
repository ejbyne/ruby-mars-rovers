require_relative '../app/models/rover'

describe Rover do

  let (:rover) { Rover.new({ orientation: 'N' }) }

  context 'initializing a rover' do

    it 'is initialized with an orientation' do
      expect(rover.orientation).to eq('N')
    end

  end

  context 'turning a rover' do

    it 'is able to turn left' do
      rover.turn('L')
      expect(rover.orientation).to eq('W')
    end

    it 'is able to turn right' do
      rover.turn('R')
      expect(rover.orientation).to eq('E')
    end
    
  end

end
