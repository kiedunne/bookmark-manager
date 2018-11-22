require 'bookmark_list'
require 'database_helpers'

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
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
      expect(bookmark.title).to eq 'Test Bookmark'
    end
  end


  describe '.delete' do
    it "deletes a bookmark" do
      connection = PG.connect(dbname: 'bookmark_manager_test')




      
    end
  end

end
