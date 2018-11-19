class BookmarkList
# attr_reader :bookmarks

  def view
    "A bookmarks list"
  end

  def self.instance
    @bookmarks
  end

  def self.create
    @bookmarks = BookmarkList.new
  end

end
