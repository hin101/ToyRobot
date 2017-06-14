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
      it 'returns the direction' do
        robot.orientation(:north)
        expect(robot.direction).to eq(:north)
      end
    end
  end

  describe '#course' do
    context 'robot is facing north' do
      it 'robot moves up' do
        robot.orientation(:north)
        expect(robot.course).to eq(x: 0, y: 1)
      end
    end

    context 'robot is facing south' do
      it 'robot moves down' do
        robot.orientation(:south)
        expect(robot.course).to eq(x: 0, y: -1)
      end
    end

    context 'robot is facing east' do
      it 'robot moves right' do
        robot.orientation(:east)
        expect(robot.course).to eq(x: 1, y: 0)
      end
    end

    context 'robot is facing west' do
      it 'robot moves left' do
        robot.orientation(:west)
        expect(robot.course).to eq(x: -1, y: 0)
      end
    end
  end

  describe '#left' do
    context 'robot is facing north' do
      it 'robot faces west' do
        robot.orientation(:north)
        robot.left
        expect(robot.direction).to eq(:west)
      end
    end

    context 'robot is facing east' do
      it 'robot faces north' do
        robot.orientation(:east)
        robot.left
        expect(robot.direction).to eq(:north)
      end
    end

    context 'robot is facing south' do
      it 'robot faces east' do
        robot.orientation(:south)
        robot.left
        expect(robot.direction).to eq(:east)
      end
    end

    context 'robot is facing west' do
      it 'robot faces south' do
        robot.orientation(:west)
        robot.left
        expect(robot.direction).to eq(:south)
      end
    end
  end

  describe '#right' do
    context 'robot is facing north' do
      it 'robot faces east' do
        robot.orientation(:north)
        robot.right
        expect(robot.direction).to eq(:east)
      end
    end

    context 'robot is facing east' do
      it 'robot faces south' do
        robot.orientation(:east)
        robot.right
        expect(robot.direction).to eq(:south)
      end
    end

    context 'robot is facing south' do
      it 'robot faces west' do
        robot.orientation(:south)
        robot.right
        expect(robot.direction).to eq(:west)
      end
    end

    context 'robot is facing west' do
      it 'robot faces north' do
        robot.orientation(:west)
        robot.right
        expect(robot.direction).to eq(:north)
      end
    end
  end
end
