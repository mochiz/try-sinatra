# frozen_string_literal: true

require_relative '../lib/db'

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
      result = sql('INSERT INTO memos (title, body) VALUES ($1, $2) RETURNING id', @title, @body)
      @id = result[0]['id']
    else
      sql('UPDATE memos SET title = $1, body = $2 WHERE id = $3', @title, @body, @id)
    end
  end

  def destroy
    sql('DELETE FROM memos WHERE id = $1', @id)
  end

  class << self
    def find(id)
      memo_data = sql('SELECT * FROM memos WHERE id = $1 LIMIT 1', id).first
      new(id: memo_data['id'], title: memo_data['title'], body: memo_data['body'])
    end

    def all
      sql('SELECT * FROM memos ORDER BY id').map do |memo_data|
        new(id: memo_data['id'], title: memo_data['title'], body: memo_data['body'])
      end
    end
  end
end
