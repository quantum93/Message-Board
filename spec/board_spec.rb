require 'rspec'
require 'board'

describe '#Board' do

  before(:each) do
    Board.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no boards") do
      expect(Board.all).to(eq([]))
    end
  end

  describe('#==') do # This check whether the duplicated board assignment for same artist or not.
    it("is the same board if it has the same attributes as another board") do
      board = Board.new({:name => "Garland Board", :message => "Do work", :id => nil})
      # board = Board.new({:name => "Garland Board", :message => "Do work", :id => nil})
      board2 = Board.new({:name => "Garland Board", :message => "Do work", :id => nil})
      # board2 = Board.new({:name => "Garland Board", :message => "Do work", :id => nil})
      expect(board).to(eq(board2))
    end
  end

  describe('.clear') do
      it("clears all boards") do
        board = Board.new({:name => "Garland Board", :message => "Do work", :id => nil})
        board2 = Board.new({:name => "Tae Board", :message => "Do work", :id => nil})
        board2.create()
        Board.clear()
        expect(Board.all).to(eq([]))
      end
    end

    describe('.find') do
      it("finds an board by id") do
        board = Board.new({:name => "Garland Board", :message => "Do work", :id => nil})
        board.create()
        board2 = Board.new({:name => "Tae Board", :message => "Do work", :id => nil})
        board2.create()
        expect(Board.find(board.id)).to(eq(board))
      end
    end

    describe('#update') do
      it("updates an board by id") do
        board = Board.new({:name => "Garland Board", :message => "Do work", :id => nil})
        board.create()
        board.update("Tae Board", "Do work" )
        expect(board.name).to(eq("Tae Board"))
      end
    end

    describe('#create') do
      it("creates a board") do
        board = Board.new({:name => "Garland Board", :message => "Do work", :id => nil})
        board.create()
        board2 = Board.new({:name => "Tae Board", :message => "Sleep", :id => nil})
        board2.create()
        expect(Board.all).to(eq([board, board2]))
      end
    end

    describe('#delete') do
      it("deletes an board by id") do
        board = Board.new({:name => "Garland Board", :message => "Do work", :id => nil})
        board.create()
        board2 = Board.new({:name => "Tae Board", :message => "Sleep", :id => nil})
        board2.create()
        board.delete()
        expect(Board.all).to(eq([board2]))
      end
    end

end
