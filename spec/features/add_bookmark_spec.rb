require 'pg'
require_relative './web_helpers.rb'

feature "Can add bookmarks to the manager" do
  scenario 'Visit page to add bookmark' do
    add_test_bookmark
    expect(page).to have_link('google', href: 'https://google.com')
  end
end
