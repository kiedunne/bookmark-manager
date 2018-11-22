require 'pg'

feature "Can add bookmarks to the manager" do
  scenario 'Visit page to add bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/add_bookmark')
    fill_in 'url', with: 'https://google.com'
    fill_in 'title', with: 'google'
    click_on('Add bookmark')
    expect(page).to have_link('google', href: 'https://google.com')
    
  end



end
