
require 'sinatra/base'
require_relative './lib/bookmark_list'

class BookmarkManager < Sinatra::Base
enable :sessions, :method_override

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = BookmarkList.all
    erb :bookmarks
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/bookmarks' do
    @bookmark =  BookmarkList.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    @bookmark =  BookmarkList.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/edit_bookmarks' do
    erb :edit_bookmarks
  end

  patch '/edit_bookmarks/:id' do
    BookmarkList.edit(params[:id],params[:title],params[:url])
    redirect '/bookmarks'
    # @bookmark = BookmarkList.edit(params[:id], params[:title], params[:url])
  end

  run! if app_file == $0
end
