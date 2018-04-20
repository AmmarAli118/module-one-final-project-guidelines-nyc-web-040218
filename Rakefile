require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  Pry.start
end

namespace :db do

  desc "Seeds the db"
  task z: ['db:seed'] do
    puts "Kakarot!"
  end
end
