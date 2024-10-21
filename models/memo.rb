# frozen_string_literal: true

require 'json'

#  Memo
class Memo
  attr_accessor :id, :title, :body

  def initialize(params = {})
    @id = params[:id]
    @title = params[:title]
    @body = params[:body]
  end

  def save
    if @id == ''
      create
    else
      update
    end
  end

  def destroy
    current_memos = self.class.all
    new_memos = current_memos.reject { |memo| memo.id == id }
    self.class.save(new_memos)
  end

  private

  def create
    current_memos = self.class.all
    @id = current_memos.map(&:id).max.to_i + 1
    new_memos = current_memos.push(self)
    self.class.save(new_memos)
  end

  def update
    current_memos = self.class.all
    new_memos = current_memos.map do |memo|
      if memo.id == @id
        memo.title = @title
        memo.body = @body
      end
      memo
    end
    self.class.save(new_memos)
  end

  class << self
    def find(id)
      all.find { |memo| memo.id == id }
    end

    def all
      file = File.read('./data/memos.json')
      memos_json = JSON.parse(file, symbolize_names: true)
      memos_json.map { |params| new(params) }
    end

    def save(memos)
      memos_json = memos.map { |memo| { id: memo.id, title: memo.title, body: memo.body } }
      File.open('./data/memos.json', 'w') do |file|
        file.puts JSON.pretty_generate(memos_json)
      end
    end
  end
end
