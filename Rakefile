# frozen_string_literal: true

require_relative 'config/application'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

Rails.application.load_tasks

Rake::Task['default'].clear

task :default do
  RSpec::Core::RakeTask.new(:spec)
  Rake::Task['spec'].invoke

  RuboCop::RakeTask.new(:rubocop)
  Rake::Task['rubocop'].invoke
  Rake::Task['rails_best_practices:run'].invoke
  Rake::Task['reek:run'].invoke
end
