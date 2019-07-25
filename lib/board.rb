require('pry')

class Board
  attr_reader :id
  attr_accessor :name, :message
  @@boards = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @message = attributes.fetch(:message)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@boards.values()
  end

  def self.clear # it works with spec files before(:each) routine.
    @@boards = {}
    @@total_rows = 0
  end

  def self.find(id) # it works with 5th spec test of festival_spec files
    @@boards[id]
  end

  def == (board_to_compare) # it works with second test of festival_spec files
    self.name() == board_to_compare.name()
    self.message() == board_to_compare.message()
  end

  def create
    warning = ""
    message = self.message
    @@boards.values.each do |board|
      if message == board.message
        next
      end
    end
    if warning == ""
      # binding.pry
      @@boards[self.id] = self
    end
    warning
  end

  def delete
    @@boards.delete(self.id)
  end

  def update(name, message)
    self.name = name
    self.message = message
    @@boards[self.id] =self
  end

  def messages
    Message.find_by_board(self.id)
  end

  def self.search(name)
  @@boards.values.select do |board|
  board.name == name
  end
end

  # def self.duplicated
  #   array = @@albums.sort_by {|key, val| val.name}
  #   @@albums = Hash[array.map { |key, val | [key,val]}]
  # end

end
