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
  @memo = Memo.find(params[:id].to_i)
  redirect('/memos') unless @memo
  erb :show
end

post '/memos' do
  @memo = Memo.new({ id: '', title: params[:title], body: params[:body] })
  @memo.save
  redirect("/memos/#{@memo.id}")
end

get '/memos/:id/edit' do
  @memo = Memo.find(params[:id].to_i)
  erb :edit
end

patch '/memos/:id' do
  @memo = Memo.find(params[:id].to_i)
  @memo.title = params[:title]
  @memo.body = params[:body]
  @memo.save
  redirect("/memos/#{@memo.id}")
end

delete '/memos/:id' do
end

not_found do
end
