require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  Pry.start
end

namespace :db do
  # desc 'Drop, create, migrate then seed the development database'
  # task reseed: [ 'db:rollback', 'db:rollback', 'db:rollback', 'db:rollback', 'db:rollback', 'db:rollback', 'db:migrate', 'db:seed' ] do
  #   puts 'Reseeding completed.'
  # end

  desc "Seeds the db"
  task z: ['db:seed'] do
    puts "Kakarot!"
  end
end
