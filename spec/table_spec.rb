require 'spec_helper'

describe 'Table' do
  let(:table) { Table.new }

  describe '#place' do
    it 'has a valid placement' do
      expect(table.place(0, 0)).to_not be_nil
    end

    it 'does not allow placement of X co-ordinate to be less than 0' do
      expect(table.place(-2, 0)).to be_nil
    end

    it 'does not allow placement of X co-ordinate to be more than 4' do
      expect(table.place(10, 0)).to be_nil
    end
    it 'does not allow placement of Y co-ordinate to be less than 0' do
      expect(table.place(0, -2)).to be_nil
    end
    it 'does not allow placement of Y co-ordinate to be more than 4' do
      expect(table.place(0, 10)).to be_nil
    end
  end

  describe '#robot_placed?' do
    it 'is initially false' do
      expect(table.robot_placed?).to eq(false)
    end

    context 'robot is placed' do
      before(:each) do
        table.place(0, 0)
      end

      it 'returns true' do
        expect(table.robot_placed?).to eq(true)
      end
    end

    context 'robot is not placed' do
      before(:each) do
        table.place(10, 10)
      end

      it 'returns false' do
        expect(table.robot_placed?).to eq(false)
      end
    end
  end

  describe '#position' do
    it 'is initially nil' do
      expect(table.position).to be_nil
    end

    context 'robot is placed' do
      before(:each) do
        table.place(0, 0)
      end

      it 'returns the co-ordinates of the robot' do
        expect(table.position).to eq(x: 0, y: 0)
      end
    end

    context 'robot is not placed' do
      before(:each) do
        table.place(10, 10)
      end

      it 'returns nil' do
        expect(table.position).to be_nil
      end
    end
  end

  describe 'Table is 3 x 3' do
    before do
      @table2 = Table.new(4, 4)
    end

    describe '#place' do
      it 'has a valid placement' do
        expect(@table2.place(0, 0)).to_not be_nil
      end

      it 'does not allow placement of X co-ordinate to be more than 3' do
        expect(@table2.place(4, 0)).to be_nil
      end

      it 'does not allow placement of Y co-ordinate to be more than 3' do
        expect(@table2.place(0, 4)).to be_nil
      end
    end
  end
end
