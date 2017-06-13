require 'spec_helper'

describe 'Robot' do
  let(:robot) { Robot.new }

  describe '#orientation' do
    it 'allows orientation to be :north' do
      expect(robot.orientation(:north)).to_not be_nil
    end

    it 'allows orientation to be :south' do
      expect(robot.orientation(:south)).to_not be_nil
    end

    it 'allows orientation to be :east' do
      expect(robot.orientation(:east)).to_not be_nil
    end

    it 'allows orientation to be :west' do
      expect(robot.orientation(:west)).to_not be_nil
    end

    it 'does not allow orientation to have an invalid heading' do
      expect(robot.orientation(:test)).to be_nil
    end
  end

  describe '#direction' do
    it 'is initially nil' do
      expect(robot.direction).to be_nil
    end

    context 'set orientation to be north' do
      before(:each) do
        robot.orientation(:north)
      end

      it 'returns the direction' do
        expect(robot.direction).to eq(:north)
      end
    end
  end

  describe '#course' do
    context 'robot is facing north' do
      before { robot.orientation(:north) }

      it 'moves up' do
        expect(robot.course).to eq(x: 0, y: 1)
      end
    end

    context 'robot is facing south' do
      before { robot.orientation(:south) }

      it 'moves down' do
        expect(robot.course).to eq(x: 0, y: -1)
      end
    end

    context 'robot is facing east' do
      before { robot.orientation(:east) }

      it 'moves right' do
        expect(robot.course).to eq(x: 1, y: 0)
      end
    end

    context 'robot is facing west' do
      before { robot.orientation(:west) }

      it 'moves left' do
        expect(robot.course).to eq(x: -1, y: 0)
      end
    end
  end
end
