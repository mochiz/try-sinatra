# frozen_string_literal: true

require 'pg'

DB_NAME = 'memo_app'

def setup_connection(dbname: DB_NAME)
  opts = {
    'user' => ENV['PG_USER'] || 'postgres',
    'password' => ENV['PG_PASSWORD'] || 'password',
    'dbname' => dbname
  }
  PG::Connection.new(opts)
end

def sql(cmd, *args)
  @connection ||= setup_connection
  @connection.exec(cmd, args)
end

def create_database
  connection = setup_connection(dbname: 'postgres')
  connection.exec("CREATE DATABASE #{DB_NAME}")
end

def create_table
  connection = setup_connection
  connection.exec('CREATE TABLE memos (id SERIAL PRIMARY KEY, title VARCHAR(255), body TEXT)')
end

def drop_database
  connection = setup_connection(dbname: 'postgres')
  connection.exec("DROP DATABASE #{DB_NAME}")
end

