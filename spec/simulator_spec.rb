require 'spec_helper'

describe 'RobotSimulator' do
  let(:robot_simulator) { RobotSimulator.new }

  describe '#execute' do
    describe 'blank string' do
      it 'ignores the command without warning the user' do
        expect(robot_simulator.execute('')).to be_nil
      end
    end
  end
end
