# frozen_string_literal: true

require 'pg'

def sql(cmd, *args)
  opts = {
    'user' => ENV['PG_USER'] || 'postgres',
    'password' => ENV['PG_PASSWORD'] || 'password',
    'dbname' => 'memo_app'
  }

  $connection ||= PG::Connection.new(opts) # rubocop:disable Style/GlobalVars
  $connection.exec(cmd, args) # rubocop:disable Style/GlobalVars
end
