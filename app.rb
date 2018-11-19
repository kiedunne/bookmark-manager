require 'sinatra/base'
require_relative './lib/bookmark_list.rb'

# here is a comment for rubocop
class BookmarkManager < Sinatra::Base

  before do
    @bookmarks = BookmarkList.instance
  end

  get '/' do
    @bookmarks = BookmarkList.create
    erb(:index)
  end

  get '/bookmarks' do
    erb(:bookmarks)
  end

  run! if app_file == $0

end
