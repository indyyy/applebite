require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'applebite'
}

# ActiveRecord::Base.establish_connection(options)

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)