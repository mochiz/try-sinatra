# frozen_string_literal: true

require 'pg'
require 'json'

def create_database
  connection = PG.connect(dbname: 'postgres')
  connection.exec('CREATE DATABASE memo_app')
end

def setup_tables
  connection = PG.connect(dbname: 'memo_app')
  connection.exec('CREATE TABLE memos (id SERIAL PRIMARY KEY, title VARCHAR(255), body TEXT)')
  file = File.read('./data/memos_seed.json')
  JSON.parse(file, symbolize_names: true).each do |memo|
    connection.exec("INSERT INTO memos (title, body) VALUES ('#{memo[:title]}', '#{memo[:body]}')")
  end
end

namespace :db do
  task :create do
    create_database
    setup_tables
  end

  task :drop do
    connection = PG.connect(dbname: 'postgres')
    connection.exec('DROP DATABASE memo_app')
  end
end
