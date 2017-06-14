require 'spec_helper'

describe 'RobotSimulator' do
  let(:robot_simulator) { RobotSimulator.new }
  let(:robot) { Robot.new }
  let(:table) { Table.new }

  describe '#execute' do
    context 'blank string' do
      it 'ignores the command without warning the user' do
        expect(robot_simulator.execute('')).to be_nil
      end
    end

    describe 'before robot has been placed' do
      context 'REPORT' do
        it 'warns the user to place the robot first' do
          expect(robot_simulator.execute('REPORT')).to eq('Robot must be placed first')
        end
      end

      describe 'PLACE' do
        context 'valid co-ordinates in a valid direction' do
          it 'places the robot on the table' do
            robot_simulator.execute('PLACE 0,1,NORTH')
          end
        end

        context 'valid co-ordinates in an invalid direction' do
          it 'does not place the robot on the table' do
            expect(robot_simulator.execute('PLACE 0,1,TEST')).to eq('Invalid arguments passed into PLACE.')
          end
        end

        context 'invalid co-ordinates in a valid direction' do
          it 'does not place the robot on the table' do
            expect(robot_simulator.execute('PLACE 0,10,NORTH')).to eq('Invalid arguments passed into PLACE.')
          end
        end
      end

      context 'MOVE' do
        it 'warns the user to place the robot first' do
          expect(robot_simulator.execute('MOVE')).to eq('Robot must be placed first')
        end
      end

      context 'RIGHT' do
        it 'warns the user to place the robot first' do
          expect(robot_simulator.execute('RIGHT')).to eq('Robot must be placed first')
        end
      end

      context 'LEFT' do
        it 'warns the user to place the robot first' do
          expect(robot_simulator.execute('LEFT')).to eq('Robot must be placed first')
        end
      end
    end

    describe 'after the robot has been placed' do
      before(:each) do
        robot_simulator.execute('PLACE 0,0,NORTH')
      end

      describe 'PLACE' do
        context 'valid co-ordinates in a valid direction' do
          it 'places the robot on the table' do
            robot_simulator.execute('PLACE 0,1,NORTH')
          end
        end

        context 'valid co-ordinates in an invalid direction' do
          it 'does not place the robot on the table' do
            expect(robot_simulator.execute('PLACE 0,1,TEST')).to eq('Invalid arguments passed into PLACE.')
          end
        end

        context 'invalid co-ordinates in a valid direction' do
          it 'does not place the robot on the table' do
            expect(robot_simulator.execute('PLACE 0,10,NORTH')).to eq('Invalid arguments passed into PLACE.')
          end
        end
      end

      describe 'REPORT' do
        it 'returns the result' do
          expect(robot_simulator.execute('REPORT')).to eq('0,0,NORTH')
        end
      end

      describe 'MOVE' do
        context 'robot is still on the table' do
          it 'moves the robot' do
            robot_simulator.execute('MOVE')
          end
        end

        context 'robot is about to fall off the table' do
          it 'warns the user and does not move the robot' do
            4.times do
              robot_simulator.execute('MOVE')
            end

            expect(robot_simulator.execute('MOVE')).to eq('Robot will fall off the table')
          end
        end
      end
    end

    describe 'LEFT' do
      it 'moves the robot left' do
        robot_simulator.execute('LEFT')
      end
    end

    describe 'RIGHT' do
      it 'moves the robot right' do
        robot_simulator.execute('RIGHT')
      end
    end
  end
end
