require 'pg'
require_relative './web_helpers.rb'

feature "Can edit a bookmark in the manager" do
  scenario 'Visit page to edit bookmark- see updated bookmark' do
    BookmarkList.create('http://www.makersacademy.com', 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    visit '/edit_bookmarks'
    fill_in 'url', with: 'http://www.makers.com'
    fill_in 'title', with: 'Fake Makers'
    click_button 'Update bookmark'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Fake Makers', href: 'http://www.makers.com')
  end
end
