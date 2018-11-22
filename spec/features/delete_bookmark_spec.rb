require 'pg'
require_relative './web_helpers.rb'

feature "Can delete bookmarks from manager" do
  scenario 'Visit page to delete bookmark' do
    BookmarkList.create('http://www.makersacademy.com', 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

      first('.bookmark_row').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
