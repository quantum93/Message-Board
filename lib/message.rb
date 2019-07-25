require('pry')

class Message
  # belongs_to :board
  attr_reader :id
  attr_accessor :name, :board_id
  @@messages = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @board_id = attributes.fetch(:board_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@messages.values
  end

  def ==(message_to_compare)
    (self.name() == message_to_compare.name()) && (self.board_id() == message_to_compare.board_id())
  end

  def self.clear
    @@messages = {}
  end

  def self.find(id)
    @@messages[id]
  end

  def create
    @@messages[self.id] = self
  end

  def update(name, board_id)
    self.name = name
    self.board_id = board_id
    @@messages[self.id] = self
  end

  def delete
    @@messages.delete(self.id)
  end

  def board
    Board.find(self.board_id)
  end

  def self.find_by_board(brd_id)
    messages = []
    @@messages.values.each do |message|
      if message.board_id == brd_id
        messages.push(message)
      end
    end
    messages
  end

end
