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
  @memo = Memo.new({ id: '', title: '', body: '' })
  erb :new
end

get '/memos/:id' do
end

post '/memos' do
  @memo = Memo.new({ id: '', title: params[:title], body: params[:body] })
  @memo.save
  redirect("/memos/#{@memo.id}")
end

get '/memos/:id/edit' do
end

patch '/memos/:id' do
end

delete '/memos/:id' do
end

not_found do
end
