require_relative '../app/models/mission_control'

describe MissionControl do

  let(:mission_control) { MissionControl.new({ plateau: plateau, rover_class: rover_class }) }
  let(:plateau) { double :plateau }
  let(:rover_class) { double :rover_class, new: rover }
  let(:rover) { double :rover, orientation: 'N' }

  context 'initializing mission control' do

    it 'is initialized with a plateau and a rover class' do
      expect(mission_control.plateau).to be(plateau)
      expect(mission_control.rover_class).to be(rover_class)
    end
  
  end

  context 'selecting a rover' do

    it 'is able to select a rover in a specified position' do
      expect(rover_class).to receive(:new).with(orientation: 'N')
      expect(plateau).to receive(:place_rover).with(:'1 2', rover)
      mission_control.select_rover('1 2 N')
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
      mission_control.turn_rover('L')
    end

    it 'is able to move a selected rover forward one cell in the direction it is facing' do
      expect(plateau).to receive(:move_rover).with(:'1 2', :'1 3', rover)
      mission_control.move_rover
    end

    it 'is able to provide a series of commands according to the specified command' do
      expect(rover).to receive(:turn).exactly(4).times
      expect(plateau).to receive(:move_rover).exactly(5).times
      mission_control.command_rover('LMLMLMLMM')
    end

    it 'is able to return the position of a selected rover' do
      expect(mission_control.rover_position).to eq('1 2 N')
    end

  end

end
