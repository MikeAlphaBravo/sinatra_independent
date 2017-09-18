require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding words', {:type => :feature}) do
  it('takes user input and displays words') do
    visit('/')
    fill_in('word', :with => 'Big')
    fill_in('definition', :with => 'The opposite of small.')
    click_button('Submit!')
    expect(page).to have_content('Big')
  end
end

describe('displays definitions', {:type => :feature}) do
  it('displays definition when word is clicked on') do
    visit('/')
    click_link('Big')
    expect(page).to have_content('The opposite of small.')
  end
end
