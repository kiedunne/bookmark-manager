require 'bookmark_list'

describe BookmarkList do

  describe ".all" do
    it "shows all bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url, title) VALUES('https://hackernoon.com', 'Hackernoon');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('https://glitch.com/', 'Glitch');")

      bookmarks = BookmarkList.all

      expect(bookmarks[0].title).to include('Hackernoon')
      expect(bookmarks[1].title).to include('Glitch')
    end
  end

  describe ".create" do
    it "creates bookmark with url and title" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = BookmarkList.create('http://www.testbookmark.com','Test Bookmark')

      expect(bookmark.url).to eq 'http://www.testbookmark.com'
      expect(bookmark.title).to eq 'Test Bookmark'
    end
  end

end
