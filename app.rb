require('sinatra')
require('sinatra/reloader')
require('./lib/board')
require('pry')
require('./lib/message')
also_reload('lib/**/*.rb')

get ('/') do
  @boards = Board.all
  erb(:boards)
end

get ('/boards') do
  @boards = Board.all
  erb(:boards)
end

get ('/boards/new') do
  erb(:new_board)
end

post ('/boards') do
  name = params[:board_name]
  message = params[:board_message]
  board = Board.new(name, message, nil)
  board.create()
  @boards = Board.all()
  erb(:boards)
end

get ('/boards/:id') do
  @board = Board.find(params[:id].to_i())
  erb(:board)
end

post ('/boards_search') do
  name = params[:search]
  @board = Board.search(name)
  erb(:board_results)
end

get ('/boards/:id/edit') do
  @board = Board.find(params[:id].to_i())
  erb(:edit_board)
end

patch ('/boards/:id') do
  @board = Board.find(params[:id].to_i())
  @board.update(params[:name, :message])
  @boards = Board.all
  erb(:boards)
end

delete ('/boards/:id') do
  @board = Board.find(params[:id].to_i())
  @board.delete()
  @boards = Board.all
  erb(:boards)
end
