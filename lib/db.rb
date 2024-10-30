# frozen_string_literal: true

require 'pg'

def setup_connection
  opts = {
    'user' => ENV['PG_USER'] || 'postgres',
    'password' => ENV['PG_PASSWORD'] || 'password',
    'dbname' => 'memo_app'
  }
  PG::Connection.new(opts)
end

def sql(cmd, *args)
  @connection ||= setup_connection
  @connection.exec(cmd, args)
end
