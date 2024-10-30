# frozen_string_literal: true

require 'pg'
require 'json'

def create_database
  connection = PG.connect(dbname: 'postgres')
  connection.exec('CREATE DATABASE memo_app')
end

def create_table
  connection = PG.connect(dbname: 'memo_app')
  connection.exec('CREATE TABLE memos (id SERIAL PRIMARY KEY, title VARCHAR(255), body TEXT)')
end

namespace :db do
  task :create do
    create_database
    create_table
  end

  task :drop do
    connection = PG.connect(dbname: 'postgres')
    connection.exec('DROP DATABASE memo_app')
  end
end
