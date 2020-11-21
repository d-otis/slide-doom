ENV['RACK_ENV']

require "bundler/setup"
Bundler.require
require 'dotenv/load'

require_all 'app'

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/slide_dev')
