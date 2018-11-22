
require 'sinatra/base'
require_relative './lib/bookmark_list'

class BookmarkManager < Sinatra::Base

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

  run! if app_file == $0
end
