require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an board path', {:type => :feature}) do
  it('creates an board and then goes to the board page') do
    visit('/boards')
    click_on('Add a new board')
    fill_in('board_name', :with => 'Garland Board')
    click_on('Go!')
    expect(page).to have_content('Garland Board')
  end
end

describe('create a message path', {:type => :feature}) do
  it('creates an board and then goes to the board page') do
    board = Board.new({:name => "Garland Board", :message => "", :id => nil})
    board.create
    save_and_open_page
    visit("/boards/#{board.id}")
    fill_in('message_name', :with => 'Do work')
    click_on('Add message')
    expect(page).to have_content('Do work')
  end
end
