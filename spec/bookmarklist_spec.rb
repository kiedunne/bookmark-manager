require 'bookmark_list'
require 'capybara/rspec'
describe BookmarkList do

  describe ".all" do
    it "shows all bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES('https://hackernoon.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://glitch.com/');")

      bookmarks = BookmarkList.all

      expect(bookmarks).to include('https://hackernoon.com')
      expect(bookmarks).to include('https://glitch.com/')
    end
  end

end
