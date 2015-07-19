require 'rubygems'
require 'bundler/setup'

require "pry"
require "active_record"
require "sinatra"
require "sinatra/reloader"

configure :development do
  require "sqlite3"
 ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'photography.db')
 end

 configure :production do
  require "pg"
  db = URI.parse(ENV['DATABASE_URL'])

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

# Models
require_relative "models/photographer.rb"
require_relative "models/photo.rb"
require_relative "models/album.rb"

# Controllers
require_relative "controllers/main.rb"

# Database
require_relative "database_setup.rb"
