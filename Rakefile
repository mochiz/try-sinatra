# frozen_string_literal: true

require_relative 'lib/db'

namespace :db do
  task :create do
    create_database
    create_table
  end

  task :drop do
    drop_database
  end
end
