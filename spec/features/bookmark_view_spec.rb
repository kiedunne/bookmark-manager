require 'pg'

feature 'View list of bookmarks' do
  scenario 'Visit page to see list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'https://hackernoon.com', 'HackerNoon');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'https://glitch.com/', 'Glitch');")

    visit('/bookmarks')

    expect(page).to have_content 'Glitch'
    expect(page).to have_content 'HackerNoon'
  end
end
