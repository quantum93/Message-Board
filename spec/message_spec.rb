require 'rspec'
require 'message'
require 'board'
require 'pry'

describe "#Message" do

  before(:each) do
    Board.clear()
    Message.clear()
    @board = Board.new({:name => "Garland Board", :message => "Do work", :id => nil})
    @board.create()
  end

  describe('#==') do
    it("is the same message if it has the same attributes as another message") do
      message = Message.new({:name => "Naima", :board_id => @board.id, :id => nil})
      message2 = Message.new({:name => "Naima", :board_id => @board.id, :id => nil})
      expect(message).to(eq(message2))
    end
  end

  describe('.all') do
    it("returns a list of all messages") do
      message = Message.new({:name => "Do work", :board_id => @board.id, :id => nil})
      message.create()
      message2 = Message.new({:name => "Sleep", :board_id => @board.id, :id => nil})
      message2.create()
      expect(Message.all).to(eq([message, message2]))
    end
  end

  describe('#create') do
    it("creates an message") do
      message = Message.new({:name => "Naima", :board_id => @board.id, :id => nil})
      message.create()
      expect(Message.all).to(eq([message]))
    end
  end

  describe('.find') do
    it("finds an message by id") do
      message = Message.new({:name => "Do work", :board_id => @board.id, :id => nil})
      message.create()
      message2 = Message.new({:name => "Sleep", :board_id => @board.id, :id => nil})
      message2.create()
      expect(Message.find(message.id)).to(eq(message))
    end
  end

  describe('#update') do
    it("updates an message by id") do
      message = Message.new({:name => "Do work", :board_id => @board.id, :id => nil})
      message.create()
      message.update("take a break", @board.id)
      expect(message.name).to(eq("take a break"))
    end
  end

  describe('#delete') do
    it("deletes an message by id") do
      message = Message.new({:name => "Do work", :board_id => @board.id, :id => nil})
      message.create()
      message2 = Message.new({:name => "Sleep", :board_id => @board.id, :id => nil})
      message2.create()
      message.delete()
      expect(Message.all).to(eq([message2]))
    end
  end

end
