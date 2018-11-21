require 'pg'

feature 'Bookmark list view' do
  scenario 'visit page to see list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES('https://hackernoon.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://glitch.com/');")

    visit('/bookmarks')

    expect(page).to have_content "https://glitch.com/"
    expect(page).to have_content "https://hackernoon.com"
  end
end
