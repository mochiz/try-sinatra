# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

require_relative 'models/memo'

get '/' do
  @memos = Memo.all
  erb :index
end

get '/memos' do
  @memos = Memo.all
  erb :index
end

get '/memos/new' do
end

get '/memos/:id' do
end

post '/memos' do
end

get '/memos/:id/edit' do
end

patch '/memos/:id' do
end

delete '/memos/:id' do
end

not_found do
end
