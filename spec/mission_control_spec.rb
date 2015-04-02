require_relative '../app/models/mission_control'

describe MissionControl do

  let(:mission_control) { MissionControl.new({ plateau: plateau, rover_class: rover_class }) }
  let(:plateau) { double :plateau }
  let(:rover_class) { double :rover_class, new: rover }
  let(:rover) { double :rover, orientation: 'N' }

  context 'selecting a rover' do

    it 'is able to select a rover in a specified position' do
      expect(rover_class).to receive(:new).with(orientation: 'N')
      expect(plateau).to receive(:place_rover).with(:'1 2', rover)
      expect(mission_control.select_rover('1 2 N')).to eq('1 2 N')
    end

    it 'will raise an error if an invalid position is specified' do
      expect{ mission_control.select_rover('') }.to raise_error('Invalid position')
      expect{ mission_control.select_rover('12N') }.to raise_error('Invalid position')
      expect{ mission_control.select_rover('1 2 Z') }.to raise_error('Invalid position')
    end

  end

  context 'commanding a rover' do

    before do
      allow(rover_class).to receive(:new).and_return(rover)
      allow(plateau).to receive(:place_rover).with(:'1 2', rover)
      mission_control.select_rover('1 2 N')
    end

    it 'is able to turn a selected rover in a specified direction' do
      expect(rover).to receive(:turn).with('L')
      allow(rover).to receive(:orientation).and_return('W')
      expect(mission_control.command_rover('L')).to eq('1 2 W')
    end

    it 'is able to move a selected rover forward one cell in the direction it is facing' do
      expect(plateau).to receive(:move_rover).with(:'1 2', :'1 3', rover)
      expect(mission_control.command_rover('M')).to eq('1 3 N')
    end

    it 'is able to provide a series of commands' do
      expect(rover).to receive(:turn).exactly(4).times
      expect(plateau).to receive(:move_rover).exactly(5).times
      mission_control.command_rover('LMLMLMLMM')
    end

    it 'does accept an invalid command' do
      expect{ mission_control.command_rover('') }.to raise_error('Invalid command')
      expect{ mission_control.command_rover('Z') }.to raise_error('Invalid command')
    end

  end

end
