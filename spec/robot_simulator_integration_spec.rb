require 'spec_helper'

describe 'RobotSimulator' do
  let(:robot_simulator) { RobotSimulator.new }

  subject do
    commands.each { |c| robot_simulator.execute(c) }
    robot_simulator.execute('REPORT')
  end

  describe 'Placing the robot' do
    let(:commands) { ['PLACE 0,0,NORTH'] }
    it { is_expected.to eq '0,0,NORTH' }
  end

  describe 'Moving the robot' do
    let(:commands) { ['PLACE 0,0,NORTH', 'MOVE'] }
    it { is_expected.to eq '0,1,NORTH' }
  end

  describe 'Rotating the robot' do
    let(:commands) { ['PLACE 0,0,NORTH', 'LEFT'] }
    it { is_expected.to eq '0,0,WEST' }
  end

  describe 'Rotating and Moving the robot' do
    let(:commands) { ['PLACE 0,0,NORTH', 'MOVE', 'MOVE', 'LEFT'] }
    it { is_expected.to eq '0,2,WEST' }
  end

  describe 'A command is issued before placing the robot' do
    let(:commands) { ['MOVE', 'PLACE 0,0,NORTH'] }
    it 'should ignore the command' do
      expect(subject).to eq('0,0,NORTH')
    end
  end

  describe 'A command is issued that will cause the robot to fall' do
    let(:commands) { ['PLACE 0,4,NORTH', 'MOVE'] }
    it 'should ignore the command' do
      expect(subject).to eq('0,4,NORTH')
    end
  end

  describe 'Succesive Placement Commands are issued to the robot' do
    let(:commands) { ['PLACE 0,0,NORTH', 'PLACE 0,0,SOUTH'] }
    it { is_expected.to eq('0,0,SOUTH') }
  end
end
