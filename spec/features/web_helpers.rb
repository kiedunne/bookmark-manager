
def add_test_bookmark
  connection = PG.connect(dbname: 'bookmark_manager_test')
  visit('/add_bookmark')
  fill_in 'url', with: 'https://google.com'
  fill_in 'title', with: 'google'
  click_on('Add bookmark')
end
