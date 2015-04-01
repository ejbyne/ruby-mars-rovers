require_relative '../app/models/mission_control'

describe MissionControl do

  let(:mission_control) { MissionControl.new({ plateau: plateau, rover_class: rover_class }) }
  let(:plateau) { double :plateau }
  let(:rover_class) { double :rover_class, new: rover }
  let(:rover) { double :rover }

  it 'is initialized with a plateau and a rover class' do

  end

  it 'is able to place and select a rover' do
    expect(rover_class).to receive(:new).with(orientation: 'N')
    expect(plateau).to receive(:place_rover).with(:'1 2', rover)
    mission_control.select_rover('1 2 N')
  end

end
