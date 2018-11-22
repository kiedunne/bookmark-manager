require 'pg'

feature 'View list of bookmarks' do
  scenario 'Visit page to see list of bookmarks' do
    add_test_bookmark
    visit('/bookmarks')
    expect(page).to have_content 'google'
  end
end
